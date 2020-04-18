module GameEntriesHelper

  def index_title
    return @group.name if @group
    return t(GameEntry, count: 2)
  end

  def get_group_id
    return @group ? @group.id : nil
  end
end
