(
if	
	(and
		(is (application_name) 'evolution')
			(or 
				(is (window_name) 'E-Mail - Evolution')
				(is (window_name) 'Kontakte - Evolution')
				(is (window_name) 'Kalender - Evolution')
				(is (window_name) 'Aufgaben - Evolution')
				(is (window_name) 'Notizen - Evolution')
			)
	)
	(begin
		( println "--[ Evolution ]--" )
        (set_viewport "2")
	)
)
