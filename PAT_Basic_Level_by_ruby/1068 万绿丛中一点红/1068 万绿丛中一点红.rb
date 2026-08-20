# 1068 万绿丛中一点红
#
# 题目描述：
#   对于计算机而言，颜色不过是像素点对应的一个 24 位的数值。现给定一幅分辨率为 M\times N 的画，要求你找出万绿丛中的一点红，即有独一无二颜色的那个像素点，并且该点的颜色与其周围 8 个相邻像素的颜色差充分大。
#
# 实现原理：
#   找出颜色独特且与周围像素差异大的点；检查8邻域像素的颜色差异；处理边界情况和多个候选点的情况
#

if __FILE__ == $PROGRAM_NAME
  m, n, t = gets.split.map(&:to_i)
  grid = []
  n.times { grid << gets.split.map(&:to_i) }

  freq = Hash.new(0)
  grid.each { |row| row.each { |v| freq[v] += 1 } }

  candidates = []
  (0...n).each do |r|
    (0...m).each do |c|
      v = grid[r][c]
      next unless freq[v] == 1

      is_red = true
      (-1..1).each do |dr|
        (-1..1).each do |dc|
          next if dr.zero? && dc.zero?

          nr = r + dr
          nc = c + dc
          next if nr.negative? || nr >= n || nc.negative? || nc >= m

          if (grid[nr][nc] - v).abs <= t
            is_red = false
            break
          end
        end
        break unless is_red
      end
      candidates << [v, c + 1, r + 1] if is_red
    end
  end

  if candidates.length == 1
    puts "(#{candidates[0][1]}, #{candidates[0][2]}): #{candidates[0][0]}"
  else
    puts candidates.empty? ? 'Not Exist' : 'Not Unique'
  end
end
