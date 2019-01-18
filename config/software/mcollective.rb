name "mcollective"
default_version '2.12.4'

dependency "ruby"
dependency "rubygems"
dependency "bundler"

version("2.11.1") { source md5: 'c62cd13bc0be6e1f45dcbd22b7d9c1db' }
version("2.11.0") { source md5: 'a17b450ae7d1289529fcee72ea124260' }
version("2.12.4") { source md5: 'd730a23825e8c0cc14c2c63419bf9ddf' }

source url: "http://war.vericity.net/mcollective-#{version}.tar.gz"

relative_path = "mcollective-#{version}"

MCOLLECTIVE_EXTRA_BINS = %w( ext/mc-irb ext/mc-rpc-restserver.rb )
GEM_DEPENDENICES = %w( systemu json stomp i18n )
  
build do
  gem (["install"] + GEM_DEPENDENICES + ["-n #{install_dir}/bin", "--no-rdoc", "--no-ri"]).join(" ")
  gem "install puppet --no-ri --no-rdoc"
  gem "install rest-client --no-ri --no-rdoc"

  # remove unneed directories
  ["docs",
   "share/man",
   "share/doc",
   "share/gtk-doc",
   "ssl/man",
   "man",
   "info"].each do |dir|
    command "rm -rf #{install_dir}/embedded/#{dir}"
  end

  # Create needed directories
  ["plugins",
   "plugins/mcollective"].each do |dir|
      command "mkdir -p #{install_dir}/#{dir}"
  end

  block do 
    def copy_bin(bin_file)
      target_filename = ::File.join(install_dir, "bin", ::File.basename(bin_file))

      File.open(bin_file, "r") do |f|
        File.open(target_filename, 'w') do |target_file|
          target_file.puts "#!#{install_dir}/embedded/bin/ruby"
          target_file.write f.lines.to_a[1..-1].join("\n")
        end

        FileUtils.chmod 0755, target_filename
      end
    end

   MCOLLECTIVE_EXTRA_BINS.each do |file|
     copy_bin(::File.join(project_dir, "mcollective-#{version}" ,file))
   end
    
    Dir.glob(::File.join(project_dir, "mcollective-#{version}", 'bin', '*')).each {|f| copy_bin(f)}
    ruby_lib_dir = ::File.join(install_dir, 'embedded', 'lib', 'ruby', '2.4.0')

    mkdir(::File.join(ruby_lib_dir, 'mcollective'))
    copy(::File.join(project_dir, "mcollective-#{version}", 'lib', '*'), ::File.join(ruby_lib_dir))

    mkdir ::File.join(install_dir, "plugins")
    mkdir ::File.join(install_dir, "plugins", "mcollective")

    copy ::File.join(project_dir, "mcollective-#{version}", "etc"), install_dir
    copy ::File.join(project.files_path, 'omnibus-mcollective.service'), install_dir

    #FileUtils.chown "root", "root", Dir.glob(File.join(install_dir, "**"))
  end
end