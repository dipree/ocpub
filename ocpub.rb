require "sys/cpu"
require "bigdecimal/math"
include Sys

puts "OCTO CPU BENCHMARK"
puts "Load Average: " + CPU.load_avg.join(", ")
puts "CPU Freq (speed): " + CPU.freq.to_s unless RUBY_PLATFORM.match('darwin')
puts "Num CPU: " + CPU.num_cpu.to_s
puts "Architecture: " + CPU.architecture
puts "Machine: " + CPU.machine
puts "Model: " + CPU.model

# CONFIG
precision = 50000
repetition = 4
durations = Array.new

0.step(to: repetition) do |step|
    puts "round #{step}"

    start_time = Time.now
    BigMath.PI(precision).to_s
    end_time = Time.now

    duration = (end_time - start_time)
    puts "Duration: " + duration.to_s
    durations.push duration
end

puts durations.inspect
puts durations.inject{ |sum, el| sum + el }.to_f / durations.size