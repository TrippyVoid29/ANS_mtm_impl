#include "xparameters.h"
#include "xil_io.h"
#include "xil_printf.h"
#include "platform.h"

#define ANS_BASEADDR   XPAR_MYIP_AXI_LITE_V1_0_BASEADDR

#define ANS_CTRL       0x00
#define ANS_STATUS     0x04
#define ANS_SYMBOL     0x08
#define ANS_STATE_IN   0x0C
#define ANS_STATE_OUT  0x10
#define ANS_BITS_OUT   0x14
#define ANS_NBITS_OUT  0x18
#define ANS_TABLE_ADDR 0x1C
#define ANS_TABLE_DATA 0x20
#define ANS_TABLE_BASE 0x1000

#define STATE_INDEX_WIDTH 2

static void ans_write(u32 offset, u32 value)
{
    Xil_Out32(ANS_BASEADDR + offset, value);
}

static u32 ans_read(u32 offset)
{
    return Xil_In32(ANS_BASEADDR + offset);
}

static int ans_self_test(void)
{
    u32 symbol = 0x41;      // 'A'
    u32 state_in = 100;

    /*
     * Rdzeñ liczy table_addr = {symbol, state_in[1:0]}
     * Dla symbolu 0x41 i state_in = 100:
     * state_in[1:0] = 0
     * table_index = 0x41 << 2 = 0x104
     */
    u32 table_index = (symbol << STATE_INDEX_WIDTH) |
                      (state_in & ((1 << STATE_INDEX_WIDTH) - 1));

    u32 expected_state = 1234;
    u32 expected_bits  = 0xAA;
    u32 expected_nbits = 4;

    /*
     * Format table_data:
     * [31:16] next_state
     * [15:8]  bits_out
     * [4:0]   nbits_out
     */
    u32 table_data = (expected_state << 16) |
                     (expected_bits  << 8)  |
                     expected_nbits;

    xil_printf("ANS AXI-Lite self-test start\r\n");
    xil_printf("ANS base address: 0x%08lx\r\n", (unsigned long)ANS_BASEADDR);
    xil_printf("table_index: 0x%lx\r\n", (unsigned long)table_index);

    // 1. Wpisz dane do tablicy tANS
    ans_write(ANS_TABLE_BASE + 4 * table_index, table_data);

    // 2. Ustaw wejœcia rdzenia
    ans_write(ANS_SYMBOL, symbol);
    ans_write(ANS_STATE_IN, state_in);

    // 3. Wyczyœæ done, jeœli wrapper obs³uguje CTRL bit 1 jako clear_done
    ans_write(ANS_CTRL, 0x2);
    ans_write(ANS_CTRL, 0x0);

    // 4. Start koprocesora
    ans_write(ANS_CTRL, 0x1);
    ans_write(ANS_CTRL, 0x0);   // start jako impuls

    // 5. Czekaj na done = STATUS bit 1
    while ((ans_read(ANS_STATUS) & 0x2) == 0) {
        // wait
    }

    // 6. Odczytaj wyniki
    u32 state_out = ans_read(ANS_STATE_OUT);
    u32 bits_out  = ans_read(ANS_BITS_OUT);
    u32 nbits_out = ans_read(ANS_NBITS_OUT);

    xil_printf("state_out = %lu\r\n", (unsigned long)state_out);
    xil_printf("bits_out  = 0x%lx\r\n", (unsigned long)bits_out);
    xil_printf("nbits_out = %lu\r\n", (unsigned long)nbits_out);

    if (state_out == expected_state &&
        bits_out == expected_bits &&
        nbits_out == expected_nbits) {
        xil_printf("TEST PASSED\r\n");
        return 0;
    } else {
        xil_printf("TEST FAILED\r\n");
        xil_printf("Expected: state=%lu bits=0x%lx nbits=%lu\r\n",
                   (unsigned long)expected_state,
                   (unsigned long)expected_bits,
                   (unsigned long)expected_nbits);
        return 1;
    }
}

int main(void)
{
    init_platform();

    int result = ans_self_test();

    cleanup_platform();
    return result;
}
