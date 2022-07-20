class BDOmeetingsModels {
  String description, descriptionindetail, time, attenders, title;
  DateTime date;
  BDOmeetingsModels({
    this.description,
    this.descriptionindetail,
    this.time,
    this.date,
    this.attenders,
    this.title,
  });
}

List<BDOmeetingsModels> meetings = [
  BDOmeetingsModels(
    attenders: "BDO,Client,Team Member",
    title: "Project 1",
    description:
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used t...",
    descriptionindetail:
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.Lorem ipsum may be used as a placeholder before final copy is available.In publishing and graphic design,Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.Lorem ipsum may be used as a placeholder before final copy is available.",
    time: "08:30 AM,Aug 8,2021",
  ),
  BDOmeetingsModels(
    attenders: "BDO,Client,Team Member",
    title: "Project 2",
    description:
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used t...",
    descriptionindetail:
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.Lorem ipsum may be used as a placeholder before final copy is available.In publishing and graphic design,Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.Lorem ipsum may be used as a placeholder before final copy is available.",
    time: "08:30 AM,Aug 8,2021",
  ),
  BDOmeetingsModels(
    attenders: "BDO,Team Member",
    title: "Project 3",
    description:
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used t...",
    descriptionindetail:
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.Lorem ipsum may be used as a placeholder before final copy is available.In publishing and graphic design,Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.Lorem ipsum may be used as a placeholder before final copy is available.",
    time: "08:30 AM,Aug 8,2021",
  ),
  BDOmeetingsModels(
    attenders: "BDO,Team Member",
    title: "Project 4",
    description:
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used t...",
    descriptionindetail:
        "In publishing and graphic design,Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.Lorem ipsum may be used as a placeholder before final copy is available.In publishing and graphic design,Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.Lorem ipsum may be used as a placeholder before final copy is available.",
    time: "08:30 AM,Aug 8,2021",
  ),
  BDOmeetingsModels(
    attenders: "BDO,Client,Team Member",
    title: "Project 5",
    description:
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used t...",
    descriptionindetail:
        "In publishing and graphic design,Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.Lorem ipsum may be used as a placeholder before final copy is available.In publishing and graphic design,Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.Lorem ipsum may be used as a placeholder before final copy is available.",
    time: "08:30 AM,Aug 8,2021",
  ),
];
Map<String, Map<String, dynamic>> dropDownData = {
  'project_type': {
    'value': 'Mobile Application',
    'list': [
      'Mobile Application',
      'Web Desiging & Development',
      'Desktop Application',
      'Data Science',
      'Shopify/Ecommerce Web'
    ],
  },
  'project_source': {
    'value': 'Fiverr',
    'list': [
      'Fiverr',
      'Upwork',
      'Guru',
      'Direct Client',
    ],
  },
  'delivery_point': {
    'value': 'Fiverr',
    'list': [
      'Fiverr',
      'Upwork',
      'Guru',
      'Other Payment Method',
    ],
  },
  'currency': {
    'value': 'USD',
    'list': [
      'USD',
      'EUR',
      'PKR',
    ],
  }
};

/// Other values
Map<String, dynamic> values = {
  'project_start_date': DateTime.now(),
  'project_end_date': DateTime.now(),
  'meeting_date': DateTime.now(),
  'meeting_time': "08:30 AM",
};

final String sampleDes =
    "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.";

List<BDOmeetingsModels> meetingList = [
  BDOmeetingsModels(
    date: DateTime.now(),
    time: "08:30 AM",
    description: sampleDes,
    attenders: "BDO, Client, Team Member",
  ),
  BDOmeetingsModels(
    date: DateTime.now(),
    time: "08:30 AM",
    description: sampleDes,
    attenders: "BDO, Client, Team Member",
  ),
  BDOmeetingsModels(
    date: DateTime.now(),
    time: "08:30 AM",
    description: sampleDes,
    attenders: "BDO, Client, Team Member",
  ),
  BDOmeetingsModels(
    date: DateTime.now(),
    time: "08:30 AM",
    description: sampleDes,
    attenders: "BDO, Client, Team Member",
  )
];
