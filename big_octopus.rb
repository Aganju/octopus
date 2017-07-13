def sluggish(fish)
  longest = ''
  fish.each do |first_fish|
    fish.each do |other_fish|
      longer_fish = first_fish.length > other_fish.length ? first_fish : other_fish
      longest = longer_fish if longer_fish.length > longest.length
    end
  end
  longest
end

def dominant(fish)
  merge_sort(fish) { |f1, f2| f1.length <=> f2.length}.last
end

def clever(fish)
  longest = ''
  fish.each do |new_fish|
    longest = new_fish if new_fish.length > longest.length
  end
  longest
end

def slow_dance(direction, tiles)
  tiles.each_with_index do |tile, index|
    return index if direction == tile
  end
end

def fast_dance(direction, tiles)
  tiles_hash = {}
  tiles.each_with_index do |tile, index|
    tiles_hash[tile] = index
  end

  tiles_hash[direction]
end

def merge_sort (array, &prc)
  return array if array.length <= 1

  mid_idx = array.length / 2
  merge(
    merge_sort(array.take(mid_idx), &prc),
    merge_sort(array.drop(mid_idx), &prc),
    &prc
  )
end

def merge(left, right, &prc)
  merged_array = []
  prc = Proc.new { |num1, num2| num1 <=> num2 } unless block_given?
  until left.empty? || right.empty?
    case prc.call(left.first, right.first)
    when -1
      merged_array << left.shift
    when 0
      merged_array << left.shift
    when 1
      merged_array << right.shift
    end
  end

  merged_array + left + right
end
