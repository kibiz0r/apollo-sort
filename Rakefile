desc "install the extension and open Chrome to http://yeticgi.apollohq.com/#/projects/409767/task_lists"
task :default do
  sh '/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --always-authorize-plugins /Users/kibiyama/git/apollo-sort/js/apollo-sort-dev.user.js http://yeticgi.apollohq.com/#/projects/409767/task_lists'
end

desc "build this shit"
task :build do
  [true, false].each do |dev|
    sources = [
      'user-script-header.coffee',
      'jquery-1.7.2.min.coffee',
      'underscore-1.3.3.min.coffee',
      'apollo-sort.user.coffee'
    ].map { |s| "src/#{s}" }.join ' '

    api_key_here = '<YOUR API KEY GOES HERE>'
    target = "js/apollo-sort#{'-dev' if dev}.user.js"

    sh "coffee --bare --join #{target} --compile #{sources}"

    if dev
      puts 'dev mode, mixing in api key'
      api_key = File.read('my_api_key').chomp
      File.write target, File.read(target).gsub(api_key_here, api_key)
    end
  end
end
