control '01' do
  title 'Verify Go install'
  desc 'Ensures package is installed and command can be run'
  impact 1

  describe package('golang') do
    it { should be_installed }
  end

  describe command('go') do
    it { should exist }
  end
end

control '02' do
  title 'Verify Go envirnonment'
  desc 'Ensures environment variables are set correctly'
  impact 0.7

  describe command('go env') do
    its('stdout') { should_not eq '/GOPATH=""/' }
    its('stdout') { should_not eq '/GOOS=""/' }
    its('stdout') { should_not eq '/GOARCH=""/' }
  end
end

control '03' do
  title 'Verify Go packages and tools'
  desc 'Ensures Go tools are installed using "go get ..."'
  impact 0.5

  describe directory('/root/go/src/golang.org/x/tools/cmd/godoc') do
    it { should exist }
  end
end
