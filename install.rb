def prepare_for_linking(filepath)
	#puts("prepare_for_linking <", filepath, ">")
    if File.symlink?(filepath)
        File.delete(filepath)
        #puts "deleting symlink #{filepath}"
        return
    end
    if File.exist?(filepath) == false
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
	link_location = File.join(Dir.home, ".bashrc")
	target = File.join(__dir__, ".bashrc")
	link(target, link_location)

	link_location = File.join(Dir.home, ".gitignore_global")
	target = File.join(__dir__, ".gitignore_global")
	link(target, link_location)

	link_location = File.join(Dir.home, ".gitconfig")
	target = File.join(__dir__, ".gitconfig")
	link(target, link_location)

	link_location = File.join(Dir.home, ".gitattributes")
	target = File.join(__dir__, ".gitattributes")
	link(target, link_location)

	link_location = File.join(Dir.home, ".xscreensaver")
	target = File.join(__dir__, ".xscreensaver")
	link(target, link_location)

	codium_config_directory = File.join(Dir.home, ".config/VSCodium/User")
	link_location = File.join(codium_config_directory, "settings.json")
	if Dir.exist?(codium_config_directory)
		target = File.join(__dir__, "vscodium_settings.json")
		link(target, link_location)
	else
		puts("skipping setting up codium setting as apparently codium is not installed")
	end

	# color schema handling
	system_version = `lsb_release -d`.sub("Description:", "").strip()
	terminal_config_folder = nil
	if ["Ubuntu 20.04.3 LTS", "Ubuntu 20.04.4 LTS", "Ubuntu 20.04.6 LTS", "Ubuntu 24.04.2 LTS"].include?(system_version)
		terminal_config_folder = "#{Dir.home}/.config/qterminal.org"
	elsif system_version == "Ubuntu 18.04.6 LTS"
		puts("unsupported system version (Lubuntu is EOL, Ubuntu 18.04 likely soon will be) <#{system_version}>")
		#terminal_config_folder = "#{Dir.home}/.config/lxterminal"
	else
		puts("unknown system version <#{system_version}>")
	end
	if terminal_config_folder != nil
		terminal_colour_scheme_config_folder = terminal_config_folder + "/color-schemes"
		raise "terminal config folder does not exist <#{terminal_config_folder}>" unless File.exist?(terminal_config_folder)
		Dir.mkdir(terminal_colour_scheme_config_folder) unless File.exist?(terminal_colour_scheme_config_folder)
		link_location = File.join(terminal_colour_scheme_config_folder, "MyTerminalColourScheme.colorscheme")
		target = File.join(__dir__, "MyTerminalColourScheme.colorscheme")
		link(target, link_location)
	end

	# setup links used by git config
	link_location = File.join(Dir.home, ".config", "compare_images.sh")
	target = File.join(__dir__, "compare_images.sh")
	link(target, link_location)
	
	# setup links used by .bashrc
	link_location = File.join(Dir.home, ".config", "my_addditions_to_bashrc.sh")
	target = File.join(__dir__, "my_addditions_to_bashrc.sh")
	link(target, link_location)

	link_location = File.join(Dir.home, ".config", "ripgrep_open_files.py")
	target = File.join(__dir__, "ripgrep_open_files.py")
	link(target, link_location)

	link_location = File.join(Dir.home, ".config", "git_aliases.sh")
	target = File.join(__dir__, "git_aliases.sh")
	link(target, link_location)
end
