module ApplicationHelper
  ZIG_GUEST_GREETINGS = [
    'The Zigzagoon says hi!',
    'A Zigzagoon is hugging you...',
    'Zigzagoon found an item!',
  ]

  def zig_says_hi
    ZIG_GUEST_GREETINGS.sample
  end
end
