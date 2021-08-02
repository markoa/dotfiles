require 'rake'
require 'erb'

namespace :install do
  desc "Install oh my zsh"
  task :ohmyzsh do
    system %Q{sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"}
  end

  desc "Install Vundle for Vim"
  task :vundle do
    system %Q{git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim}
    system %Q{vim +PluginInstall +qall}
  end

  desc "Install Homebrew"
  task :homebrew do
    system %Q{/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"}
  end

  desc "Install the dot files into user's home directory"
  task :dotfiles do
    replace_all = false
    Dir['*'].select { |f| File.file?(f) }.each do |file|
      next if %w[Rakefile README.md LICENSE].include? file
      
      if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
        if File.identical? file, File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
          puts "identical ~/.#{file.sub('.erb', '')}"
        elsif replace_all
          replace_file(file)
        else
          print "overwrite ~/.#{file.sub('.erb', '')}? [ynaq] "
          case $stdin.gets.chomp
          when 'a'
            replace_all = true
            replace_file(file)
          when 'y'
            replace_file(file)
          when 'q'
            exit
          else
            puts "skipping ~/.#{file.sub('.erb', '')}"
          end
        end
      else
        link_file(file)
      end
    end
  end
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "#{ENV['PWD']}/#{file}" "#{ENV['HOME']}/.#{file}"}
  end
end

# Inspired by https://github.com/ryanb/dotfiles
