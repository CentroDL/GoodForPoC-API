# frozen_string_literal: true

Sequel.migration do
  change do
    create_table(:questions) do
        primary_key :id

        String :name, null: false, unique: true
        String :template, null: false
        String :title, null: false
        String :help_text
        Integer :group
        String :settings, text: true

        DateTime :created_at, default: Sequel::SQL::Function.new(:now)
        DateTime :updated_at, default: Sequel::SQL::Function.new(:now)
    end
  end
end
