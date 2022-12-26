require "bigdecimal/math"
require "sinatra"
# require "sys/cpu"
# include Sys

# puts "OCTO CPU BENCHMARK"
# puts "Load Average: " + CPU.load_avg.join(", ")
# puts "CPU Freq (speed): " + CPU.freq.to_s unless RUBY_PLATFORM.match('darwin')
# puts "Num CPU: " + CPU.num_cpu.to_s
# puts "Architecture: " + CPU.architecture
# puts "Machine: " + CPU.machine
# puts "Model: " + CPU.model

# Config
$precision = 100000
$repetition = 10
$durations = Array.new
$execution_date = Time.now.utc

Thread.new do
    0.step(to: $repetition) do |round|
        puts "#{round+1}. Round"

        start_time = Time.now
        BigMath.PI($precision).to_s
        end_time = Time.now

        $duration = (end_time - start_time)
        puts "Duration: " + $duration.to_s
        $durations.push $duration
    end

    puts $durations.inspect
    puts $durations.inject{ |sum, el| sum + el }.to_f / $durations.size
end

get '/' do
    @average_duration = $durations.inject{ |sum, el| sum + el }.to_f / $durations.size
    @execution_date = $execution_date.strftime("%d-%m-%Y, %I:%M:%S %p")
    erb :index
end