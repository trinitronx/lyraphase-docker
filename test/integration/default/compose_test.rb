# frozen_string_literal: true

install_binary = input('install_binary')
version = input('version')
version_regexp = Regexp.new(version, Regexp::IGNORECASE | Regexp::MULTILINE)

describe command('docker-compose -v') do
  its('stdout') { should match(/docker-compose version/) }
  its('stdout') { should match(version_regexp) }
end

if install_binary
  describe command('dpkg -l docker-compose') do
    its('stderr') { should match(/no packages found matching docker-compose$/) }
  end
else
  describe command('dpkg -l docker-compose') do
    its('stdout') { should match(/^ii.*docker-compose.*$/) }
  end
end