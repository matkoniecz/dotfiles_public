def prepare_for_linking(filepath)
    if File.symlink?(filepath)
        File.delete(filepath)
        #puts "deleting symlink #{filepath}"
        return
    end
    if File.exists?(filepath) == false
        #puts "file not existing #{filepath}"
        return
    end
    raise "file #{filepath} exists and is not a symbolic link, was not removed to prevent accidental damage"
end

def link(target, link_location)
    prepare_for_linking(link_location)
	if Gem.win_platform?
		# Windows
		puts	"mklink  \"#{link_location}\" \"#{target}\""
		`mklink  "#{link_location}" "#{target}"`
	else
		# Hopefully actually Linux
		`ln -s "#{target}" "#{link_location}"`
	end
end

# https://stackoverflow.com/a/21468976
if Gem.win_platform?
	# Windows
	
	# and that is why I hate Windows...
	# https://stackoverflow.com/questions/4050905/changing-gitconfig-location-on-windows
	# https://superuser.com/questions/129299/got-not-sufficient-privileges-message-in-cmd-when-logged-on-as-administrator

	link_location = File.join("%HOMEPATH%", ".gitconfig")
	target = File.join(__dir__, ".gitconfig")
	link(target, link_location)
	
	link_location = File.join("%HOMEPATH%", ".gitattributes")
	target = File.join(__dir__, ".gitattributes")
	link(target, link_location)
	
	link_location = File.join("%HOMEPATH%", ".gitignore_global")
	target = File.join(__dir__, ".gitignore_global")
	link(target, link_location)
	
	# run following in powershell to get location of a profile...
	# echo $profile
	`mkdir "%HOMEPATH%"\\Documents\\WindowsPowerShell"`
	link_location = File.join("%HOMEPATH%", "Documents", "WindowsPowerShell" , "Microsoft.PowerShell_profile.ps1")
	target = File.join(__dir__, "windows_power_shell_profile.ps1")
	link(target, link_location)
	
	# note that something from following will be needed
	# https://serverfault.com/questions/31194/how-do-i-change-my-default-powershell-profile-digitially-sign-my-profile-file
else
	# Hopefully actually Linux

	# link config files directly
	link("#{__dir__}/.bashrc", "$HOME/.bashrc")
	link("#{__dir__}/.gitignore_global", "$HOME/.gitignore_global")
	link("#{__dir__}/.gitconfig", "$HOME/.gitconfig")
	link("#{__dir__}/.gitattributes", "$HOME/.gitattributes")
	link("#{__dir__}/vscodium_settings.json", "$HOME/.config/VSCodium/User/settings.json")

	# setup links used by .bashrc
	link("#{__dir__}/my_addditions_to_bashrc.sh", "$HOME/.config/my_addditions_to_bashrc.sh")
	link("#{__dir__}/git_aliases.sh", "$HOME/.config/git_aliases.sh")
end
