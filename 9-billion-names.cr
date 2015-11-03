def g(n, g)
  1 unless 1 < g && g < n - 1
  (2..g).inject(1) { |res, q| res + (q > n - g ? 0 : g(n - g, q)) }
end

(1..25).each do |n|
  puts (1..n).map { |g| "%4s" % g(n, g) }.join
end
