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
  t = gets.to_i

  # 简单线性同余发生器，产生 1~3 的电脑点数（确定性、可复现）
  state = 1
  computer_point = lambda do
    state = (state * 7 + 3) % 11
    state % 3 + 1
  end

  while t.positive?
    line = gets
    break if line.nil?

    n_bet, b = line.split.map(&:to_i)
    break if n_bet.nil?

    n_bet = t if n_bet > t
    cp = computer_point.call
    if b == cp
      t += n_bet
      puts "Win!  You have #{t} now."
    else
      t -= n_bet
      if t <= 0
        puts 'Game Over.'
        break
      end
      puts "Lose!  You have #{t} now."
    end
  end
end
