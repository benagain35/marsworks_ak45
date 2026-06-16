import sys
if sys.prefix == '/usr':
    sys.real_prefix = sys.prefix
    sys.prefix = sys.exec_prefix = '/home/marsworks/ben_ws_modified/install/ak45_velocity_mapper'
