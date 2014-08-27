update test set _offset=regexp_substr(_offset,'(.*-)') || lpad(CAST(regexp_substr(_offset, '-(.*)$', 1, 1, '', 1) as VARCHAR) , 20, '0');
