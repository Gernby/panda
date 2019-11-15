from panda.tests.safety import libpandasafety_py

def make_msg(bus, addr, length):
  to_send = libpandasafety_py.ffi.new('CAN_FIFOMailBox_TypeDef *')
  to_send[0].RIR = addr << 21
  to_send[0].RDTR = length
  to_send[0].RDTR = bus << 4

  return to_send

def test_relay_malfunction(test, addr):
  # input is a test class and the address that, if seen on bus 0, triggers
  # the relay_malfunction logic
  test.assertFalse(test.safety.get_relay_malfunction())
  test.safety.safety_rx_hook(make_msg(0, addr, 8))
  test.assertTrue(test.safety.get_relay_malfunction())
  for a in range(1, 0x800):
    for b in range(0, 3):
      test.assertFalse(test.safety.safety_tx_hook(make_msg(b, a, 8)))