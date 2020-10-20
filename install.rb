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
    `ln -s "#{target}" "#{link_location}"`
end

link("#{__dir__}/.bashrc", "$HOME/.bashrc")
link("#{__dir__}/.gitignore_global", "$HOME/.gitignore_global")
link("#{__dir__}/.gitconfig", "$HOME/.gitconfig")
link("#{__dir__}/.gitattributes", "$HOME/.gitattributes")
