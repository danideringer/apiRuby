# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180308074037) do

  create_table "data", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "device_id"
    t.bigint "variable_id"
    t.bigint "frame_id"
    t.string "value_type"
    t.bigint "value_id"
    t.index ["device_id", "variable_id", "timestamp"], name: "index_data_on_device_id_and_variable_id_and_timestamp", unique: true
    t.index ["device_id"], name: "index_data_on_device_id"
    t.index ["frame_id"], name: "index_data_on_frame_id"
    t.index ["value_type", "value_id"], name: "index_data_on_value_type_and_value_id"
    t.index ["variable_id"], name: "index_data_on_variable_id"
  end

  create_table "devices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "code", null: false
    t.string "name"
    t.integer "last_frame_id"
    t.datetime "last_frame_at"
    t.decimal "latitude", precision: 16, scale: 12
    t.decimal "longitude", precision: 16, scale: 12
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_devices_on_code", unique: true
  end

  create_table "devices_variables", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "device_id", null: false
    t.bigint "variable_id", null: false
    t.index ["device_id", "variable_id"], name: "index_devices_variables_on_device_id_and_variable_id"
    t.index ["variable_id", "device_id"], name: "index_devices_variables_on_variable_id_and_device_id"
  end

  create_table "float_values", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal "value", precision: 36, scale: 18
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "frames", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "raw"
    t.string "source_ip"
    t.datetime "timestamp"
    t.boolean "processed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["timestamp"], name: "index_frames_on_timestamp"
  end

  create_table "latest_data", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "device_id", null: false
    t.bigint "variable_id", null: false
    t.string "value"
    t.datetime "timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id", "variable_id"], name: "index_latest_data_on_device_id_and_variable_id", unique: true
    t.index ["device_id"], name: "index_latest_data_on_device_id"
    t.index ["variable_id"], name: "index_latest_data_on_variable_id"
  end

  create_table "string_values", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "value", limit: 4096
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "variables", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "code", null: false
    t.string "name"
    t.string "symbol"
    t.integer "value_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_variables_on_code", unique: true
  end

  add_foreign_key "data", "devices"
  add_foreign_key "data", "frames"
  add_foreign_key "data", "variables"
  add_foreign_key "latest_data", "devices"
  add_foreign_key "latest_data", "variables"
end
