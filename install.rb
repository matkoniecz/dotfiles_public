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

prepare_for_linking("#{ENV['HOME']}/.bashrc")
`ln -s "#{__dir__}/.bashrc" "$HOME/.bashrc"`

prepare_for_linking("#{ENV['HOME']}/.gitignore_global")
`ln -s "#{__dir__}/.gitignore_global" "$HOME/.gitignore_global"`

prepare_for_linking("#{ENV['HOME']}/.gitconfig")
`ln -s "#{__dir__}/.gitconfig" "$HOME/.gitconfig"`

prepare_for_linking("#{ENV['HOME']}/.gitattributes")
`ln -s "#{__dir__}/.gitattributes" "$HOME/.gitattributes"`
