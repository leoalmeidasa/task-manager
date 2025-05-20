class CreateSolidQueueTables < ActiveRecord::Migration[8.0]
  def change
    enable_extension "pg_catalog.plpgsql"

    create_table "solid_queue_jobs", force: :cascade do |t|
      t.string "queue_name", null: false
      t.string "class_name", null: false
      t.jsonb "arguments"
      t.integer "priority", default: 0, null: false
      t.string "active_job_id"
      t.datetime "scheduled_at"
      t.datetime "finished_at"
      t.string "concurrency_key"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["active_job_id"], name: "index_solid_queue_jobs_on_active_job_id"
      t.index ["queue_name", "finished_at"], name: "index_solid_queue_jobs_on_queue_name_and_finished_at"
    end

    create_table "solid_queue_blocked_executions", force: :cascade do |t|
      t.bigint "job_id", null: false
      t.string "queue_name", null: false
      t.integer "priority", default: 0, null: false
      t.string "concurrency_key", null: false
      t.datetime "expires_at", null: false
      t.datetime "created_at", null: false
      t.index ["concurrency_key", "priority", "job_id"], name: "index_solid_queue_blocked_executions_for_release"
      t.index ["expires_at", "concurrency_key"], name: "index_solid_queue_blocked_executions_for_maintenance"
      t.index ["job_id"], name: "index_solid_queue_blocked_executions_on_job_id", unique: true
    end

    create_table "solid_queue_claimed_executions", force: :cascade do |t|
      t.bigint "job_id", null: false
      t.bigint "process_id"
      t.datetime "created_at", null: false
      t.index ["job_id"], name: "index_solid_queue_claimed_executions_on_job_id", unique: true
      t.index ["process_id", "job_id"], name: "index_solid_queue_claimed_executions_on_process_id_and_job_id"
    end

    create_table "solid_queue_failed_executions", force: :cascade do |t|
      t.bigint "job_id", null: false
      t.text "error"
      t.datetime "created_at", null: false
      t.index ["job_id"], name: "index_solid_queue_failed_executions_on_job_id", unique: true
    end

    create_table "solid_queue_pauses", force: :cascade do |t|
      t.string "queue_name", null: false
      t.datetime "created_at", null: false
      t.index ["queue_name"], name: "index_solid_queue_pauses_on_queue_name", unique: true
    end

    create_table "solid_queue_processes", force: :cascade do |t|
      t.string "kind", null: false
      t.datetime "last_heartbeat_at", null: false
      t.bigint "supervisor_id"
      t.integer "pid", null: false
      t.string "hostname"
      t.jsonb "metadata"
      t.datetime "created_at", null: false
      t.string "name"
      t.index ["supervisor_id"], name: "index_solid_queue_processes_on_supervisor_id"
    end

    create_table "solid_queue_ready_executions", force: :cascade do |t|
      t.bigint "job_id", null: false
      t.string "queue_name", null: false
      t.integer "priority", default: 0, null: false
      t.datetime "created_at", null: false
      t.index ["job_id"], name: "index_solid_queue_ready_executions_on_job_id", unique: true
      t.index ["priority", "job_id"], name: "index_solid_queue_ready_executions_for_execution"
    end

    create_table "solid_queue_recurring_executions", force: :cascade do |t|
      t.string "task_key", null: false
      t.datetime "run_at", null: false
      t.datetime "created_at", null: false
      t.index ["task_key"], name: "index_solid_queue_recurring_executions_on_task_key", unique: true
    end

    create_table "solid_queue_scheduled_executions", force: :cascade do |t|
      t.bigint "job_id", null: false
      t.string "queue_name", null: false
      t.integer "priority", default: 0, null: false
      t.datetime "scheduled_at", null: false
      t.datetime "created_at", null: false
      t.index ["job_id"], name: "index_solid_queue_scheduled_executions_on_job_id", unique: true
      t.index ["scheduled_at", "priority", "job_id"], name: "index_solid_queue_scheduled_executions_for_dispatch"
    end

    create_table "solid_queue_semaphores", force: :cascade do |t|
      t.string "key", null: false
      t.integer "value", default: 1, null: false
      t.datetime "expires_at", null: false
      t.datetime "created_at", null: false
      t.index ["key"], name: "index_solid_queue_semaphores_on_key", unique: true
      t.index ["expires_at"], name: "index_solid_queue_semaphores_on_expires_at"
    end
  end
end