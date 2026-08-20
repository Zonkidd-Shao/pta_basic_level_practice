# 1055 集体照
#
# 题目描述：
#   拍集体照时队形很重要，这里对给定的 N 个人 K 排的队形设计排队规则如下：
#   - 每排人数为 N/K（向下取整），多出来的人全部站在最后一排；
#   - 后排所有人的个子都不比前排任何人矮；
#   - 每排中最高者站中间（中间位置为 m/2+1，其中 m 为该排人数，除法向下取整）；
#   - 每排其他人以中间人为轴，按身高非增序，先右后左交替入队站在中间人的两侧（例如5人身高为190、188、186、175、170，则队形为175、188、190、186、170。这里假设你面对拍照者，所以你的左边是中间人的右边）；
#   - 若多人身高相同，则按名字的字典序升序排列。这里保证无重名。
#   现给定一组拍照人，请编写程序输出他们的队形。
#
# 实现原理：
#   按身高和姓名排序；计算每排的人数和排列方式；中间最高，左右依次降低排列
#

if __FILE__ == $PROGRAM_NAME
  n, k = gets.split.map(&:to_i)
  students = []
  n.times do
    name, height = gets.split
    students << { name: name, height: height.to_i }
  end
  # 身高降序，同身高姓名升序
  students.sort_by! { |s| [-s[:height], s[:name]] }

  per_row = n / k
  rows = [n - per_row * (k - 1)] + Array.new(k - 1, per_row)
  idx = 0

  rows.each do |size|
    row = students[idx, size]
    idx += size
    len = row.length
    seats = Array.new(len)
    mid = len / 2
    seats[mid] = row[0][:name]
    left = mid - 1
    right = mid + 1
    row[1..].each_with_index do |stu, j|
      if j.even?
        seats[left] = stu[:name]
        left -= 1
      else
        seats[right] = stu[:name]
        right += 1
      end
    end
    puts seats.join(' ')
  end
end
