//
//  RaidTopViewController.swift
//  1234
//
//  Created by Ilnur Bikmaev on 11.06.2020./Users/ilnurbikmaev/Desktop/work/1234/1234/1234/API.swift
//  Copyright © 2020 Ilnur Bikmaev. All rights reserved.
//

import UIKit
import Network

class RaidTopTableCell: UITableViewCell {
    
    @IBOutlet weak var guildName: UILabel!
}

class RaidTopViewController: UIViewController {
    var raidTop: [FetchRaidTopQuery.Data.RaidTop]? {
        didSet {
            tableView.reloadData();
        }
    }
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData();
    }
     
    
    func loadData() {
        apollo.fetch(query: FetchRaidTopQuery())  { result in
            guard let data = try? result.get().data else {
                print("net");
                return }
            self.raidTop = data.raidTop;
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RaidTopViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return raidTop?.count ?? 0;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RaidCell", for: indexPath) as! RaidTopTableCell;
        let guild: FetchRaidTopQuery.Data.RaidTop = raidTop![indexPath.row];
        cell.guildName.text = guild.guildName;
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view = storyboard?.instantiateViewController(withIdentifier: "RaidDetailViewControllerScene") as? RaidDetailViewController;
        let guild: FetchRaidTopQuery.Data.RaidTop = raidTop![indexPath.row];
        view?.title = guild.guildName;
        view?.guild = [
            ["Место", String(guild.place)],
            ["Сторона", guild.fraction == "horde" ? "Орда" : "Альянс"],
            ["Сервер", guild.realm],
            ["Прогресс", guild.progress]
        ]
        self.navigationController?.pushViewController(view!, animated: true);
    }
}
