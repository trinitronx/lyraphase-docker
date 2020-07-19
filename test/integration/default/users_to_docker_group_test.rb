# frozen_string_literal: true

# Ensure that a user is added to the Docker group

describe group('docker') do
  it { should exist }
end

describe user('vagrant') do
  it { should exist }
  its('groups') { should include 'docker' }
end
