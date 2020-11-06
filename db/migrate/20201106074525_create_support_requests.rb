class CreateSupportRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :support_requests do |t|
      t.string :email, comment: "Email of the submitter"
      t.string :subject, comment: "Subject of the support email"
      t.text :body, comment: "Body of the support email"
      t.references :order, foreign_key: true, comment: "their most recent order, if applicable"

      t.timestamps
    end
  end
end
