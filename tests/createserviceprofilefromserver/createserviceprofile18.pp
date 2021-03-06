include ciscoucs

import '../data.pp'

transport_ciscoucs { 'ciscoucs':
  username => "${ciscoucs['username']}",
  password => "${ciscoucs['password']}",
  server   => "${ciscoucs['server']}",
}

ciscoucs_serviceprofile { 'serviceprofile_name':
  serviceprofile_name   => "${ciscoucs_serviceprofile['serviceprofile_name']}",
  organization          => "${ciscoucs_serviceprofile['organization']}",
  #profile_dn           => "  ",
  server_chassis_id     => "#",
  server_slot           => "${ciscoucs_serviceprofile['server_slot']}",
  ensure                => "${ciscoucs_serviceprofile['ensure']}",
  transport             => Transport_ciscoucs['ciscoucs'],
}
