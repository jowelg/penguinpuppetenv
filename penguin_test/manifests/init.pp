class penguin_test (
String $localsetting = undef,
){

file { '/tmp/sampletemplate':
 ensure => present,
 content => epp('penguin_test/ipinfo.epp',
		{ localsetting => $localsetting,}),

}

$message = hiera('FROMHIERA')
notify { $message: }

file { '/tmp/samplehiera':
 ensure => present,
 content => epp('penguin_test/ipinfo.epp',
               { localsetting => $message, }),
}

}
