module HideColumns

  def self.included(klass)
    klass.class_eval do
      extend HideColumns::ClassMethods
    end
  end

  module ClassMethods

    def hide_columns(columns)
      column_regex = columns.join('|')

      self.metaclass.class_eval do
        send :alias_method, :orig_content_columns, :content_columns
        define_method :content_columns do
          @_content_columns ||= orig_content_columns.reject { |col| col.name =~ /^(#{column_regex})$/ }
        end
      end
    end

  end

end

ActiveRecord::Base.class_eval { include HideColumns }
