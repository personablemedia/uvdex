module TyCorp
	module FileChangeChecker
		class << self
			def file_has_been_changed( old_md5, new_csv )
				new_md5 = Digest::MD5.file(new_file)
				new_file == old_md5
			end
		end
	end
end
