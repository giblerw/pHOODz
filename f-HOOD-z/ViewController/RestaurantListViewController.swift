
import UIKit

final class RestaurantListViewController: UIViewController,
  PlacesManagerDelegate,
  UITableViewDataSource,
  UITableViewDelegate,
  UISearchBarDelegate {

  @IBOutlet var tableView: UITableView!
  @IBOutlet var searchBar: UISearchBar!
  @IBOutlet weak var refreshBarButton: UIBarButtonItem!

  let placesManager = PlacesManager.shared()
  var places = [GooglePlaceJSONModel]()
  var filteredPlaces = [GooglePlaceJSONModel]()
  var displayFilteredPlaces = false
  let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
  var dismissKeyboardTap = UIGestureRecognizer()

  // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    placesManager.delegate = self
print(places)
    dismissKeyboardTap = (UITapGestureRecognizer(target: self,
                                                 action: #selector(dismissSearchbarKeyboard)))

    // show an activity indicator when the tableview is empty
    tableView.backgroundView = activityIndicator
    activityIndicator.hidesWhenStopped = true
    activityIndicator.startAnimating()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "RestaurantDetailSegue" {
      let destination = segue.destination as? RestaurantDetailViewController,
      selectedRow = tableView.indexPathForSelectedRow,
      place = displayFilteredPlaces ? filteredPlaces[selectedRow!.row] : places[selectedRow!.row]
      destination?.place = place
      print("detail")
    }
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
  }

  // MARK: - UITableViewDataSource

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell =
      tableView.dequeueReusableCell(
        withIdentifier: HeadlineCell.cellReuseIdentifier,
        for: indexPath)
      as? HeadlineCell else { // panic
      fatalError("Dequeued cell should be a HeadlineCell")
    }

    let place = displayFilteredPlaces ? filteredPlaces[indexPath.row] : places[indexPath.row]
    cell.configureWith(place.headlineCellData)
    return cell
  }

  // MARK: - Table view data source

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if displayFilteredPlaces {
      return filteredPlaces.count
    }
    return places.count
  }

  // MARK: - PlacesManagerDelegate

  func placesManager(_ manager: PlacesManager, didUpdate googlePlaces: [GooglePlaceJSONModel]) {
    places = googlePlaces
    filteredPlaces = places
    tableView.reloadData()
    activityIndicator.stopAnimating()
    refreshBarButton.isEnabled = true
    print(places[0])
  }

  func placesManager(_ manager: PlacesManager, didEncounterError error: PlacesErrorType) {
    let alert = UIAlertController(title: error.title,
                                  message: error.body,
                                  preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default,
                                 handler: nil)
    alert.addAction(okAction)
    present(alert, animated: true, completion: nil)
  }

  // MARK: - UISearchBarDelegate and Keyboard Control

  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

    if searchText == "" {
      displayFilteredPlaces = false
      filteredPlaces = places
      tableView.reloadData()
      return
    }

    filteredPlaces = places.filter {
      return $0.name!.lowercased().hasPrefix(searchText.lowercased())
    }
    displayFilteredPlaces = true
    tableView.reloadData()
  }

  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    view.addGestureRecognizer(dismissKeyboardTap)
  }

  @objc func dismissSearchbarKeyboard() {
    view.removeGestureRecognizer(dismissKeyboardTap)
    self.searchBar.endEditing(true)
  }

  // MARK: - Refresh Button Action

  @IBAction func refreshButtonTap(_ sender: Any) {
    places = [GooglePlaceJSONModel]()
    filteredPlaces = places
    searchBar.text = ""
    refreshBarButton.isEnabled = false
    activityIndicator.startAnimating()
    tableView.reloadData()
    placesManager.refreshPlaces()
  }
}
