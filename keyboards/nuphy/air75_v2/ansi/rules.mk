SRC += side.c rf.c sleep.c rf_driver.c kb_util.c side_driver.c

UART_DRIVER_REQUIRED = yes

# Enable shared endpoint for Globe key to work as modifier
KEYBOARD_SHARED_EP = yes
