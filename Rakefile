
promptOut = './bin/prompt'
promptSrc = './src/prompt.moon'

task :default => :build

task :build do
    sh "echo \"#!/usr/bin/env luajit\" >#{promptOut}"
    sh "moonc -p #{promptSrc} >>#{promptOut}" 	   	 
end


task :clean do
    sh "rm bin/*"
end
