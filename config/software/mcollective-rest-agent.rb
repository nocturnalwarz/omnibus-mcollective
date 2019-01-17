name "mcollective-rest-agent"
default_version "0.0.4"

dependency "mcollective"

version("0.0.1") { source md5: '6a5b410c7e6568fbc0ad68bedeef716a' }
version("0.0.2") { source md5: '9703623aa9376e74316ba12b2487bf52' }
version("0.0.3") { source md5: 'ae93e65a5f60e0928e2712cd0ec7fcd2' }
version("0.0.4") { source md5: 'c65da8c6f0b9d9bf872e2a086f590d58' }

source url: "https://github.com/nocturnalwarz/mcollective-rest/archive/#{version}.tar.gz"

relative_path = "mcollective-rest-#{version}"

build do
  block do
    %w(agent).each do |dir|
      FileUtils.cp_r File.join(project_dir, "mcollective-rest-#{version}", dir), ::File.join(install_dir, "plugins", "mcollective")
    end
  end
end