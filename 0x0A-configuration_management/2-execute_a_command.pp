# This manifest kills a process named 'killmenow'

exec { 'killmenow':
  command => 'pkill -15 killmenow',
  path    => ['/usr/bin', '/bin']
}
