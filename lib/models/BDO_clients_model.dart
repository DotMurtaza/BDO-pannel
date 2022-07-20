class BDOclientModels {
  String name;
  String title;
  String date;
  String phone;
  String email;
  String country;
  String description;
  String source;

  int cost;
  String type;
  BDOclientModels({
    this.name,
    this.date,
    this.title,
    this.email,
    this.phone,
    this.country,
    this.description,
    this.type,
    this.source,
    this.cost,
  });
}

List<BDOclientModels> clients = [
  BDOclientModels(
    name: 'Ahmad',
    date: '2021/09/20',
    title: 'Android App',
    email: 'Client@gmail.com',
    phone: '923001234567',
    country: 'Pakistan',
    type: "Mobile Application",
    source: "Fiverr",
    cost: 45000,
    description:
        "A Mobile Application to manage projects in software house. App will helps different teams to interact on same project from anywhere easily.",
  ),
  BDOclientModels(
    name: 'Amad',
    date: '2021/02/13',
    title: 'Web',
    email: 'Client@gmail.com',
    phone: '923001234567',
    country: 'Pakistan',
    type: "Mobile Application",
    source: "Fiverr",
    cost: 45000,
    description:
        "A Mobile Application to manage projects in software house. App will helps different teams to interact on same project from anywhere easily.",
  ),
  BDOclientModels(
    name: 'Abrar',
    date: '2021/06/07',
    title: 'Web',
    email: 'Client@gmail.com',
    phone: '923001234567',
    country: 'Pakistan',
    type: "Mobile Application",
    source: "Fiverr",
    cost: 45000,
    description:
        "A Mobile Application to manage projects in software house. App will helps different teams to interact on same project from anywhere easily.",
  ),
  BDOclientModels(
    name: 'Hammad',
    date: '2021/09/20',
    title: 'Android App',
    email: 'Client@gmail.com',
    phone: '923001234567',
    country: 'Pakistan',
    type: "Mobile Application",
    source: "Fiverr",
    cost: 65000,
    description:
        "A Mobile Application to manage projects in software house. App will helps different teams to interact on same project from anywhere easily.",
  ),
];
