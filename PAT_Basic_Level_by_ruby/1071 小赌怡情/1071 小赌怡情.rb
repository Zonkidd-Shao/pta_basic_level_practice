# 1071 小赌怡情
#
# 题目描述：
#   常言道“小赌怡情”。这是一个很简单的小游戏：首先由计算机给出第一个整数；然后玩家下注赌第二个整数将会比第一个数大还是小；玩家下注 t 个筹码后，计算机给出第二个数。若玩家猜对了，则系统奖励玩家 t 个筹码；否则扣除玩家 t 个筹码。
#   注意：玩家下注的筹码数不能超过自己帐户上拥有的筹码数。当玩家输光了全部筹码后，游戏就结束。
#
# 实现原理：
#   模拟赌博游戏的输赢；根据每次下注和结果更新筹码；处理筹码不足和游戏提前结束的情况
#

if __FILE__ == $PROGRAM_NAME
  data = STDIN.read.split.map(&:to_i)
  tokens = data.shift
  games = data.shift
  games.times do |i|
    n1, bet_high, wager, n2 = data[i * 4, 4]
    break if tokens.zero?
    if wager > tokens
      puts "Not enough tokens.  Total = #{tokens}."
      next
    end

    win = (n1 > n2 && bet_high.zero?) || (n1 < n2 && bet_high == 1)
    if win
      tokens += wager
      puts "Win #{wager}!  Total = #{tokens}."
    else
      tokens -= wager
      puts "Lose #{wager}.  Total = #{tokens}."
      if tokens.zero?
        puts 'Game Over.'
        break
      end
    end
  end
end
