class ServerCell < PM::TableViewCell
  def on_load
    find(contentView).apply_style(:content_view)
    find(self.contentView).append(UILabel, :title)
    find(self.contentView).append(UILabel, :subtitle)
  end

  def title=(title)
    find(self).find(:title).data(title)
  end

  def subtitle=(subtitle)
    find(self).find(:subtitle).data(subtitle)
  end
end
