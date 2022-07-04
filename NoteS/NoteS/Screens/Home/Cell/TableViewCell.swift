//
//  TableViewCell.swift
//  NoteS
//
//  Created by Adem Tarhan on 4.07.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelNoteDate: UILabel!
    @IBOutlet weak var labelNoteContext: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
