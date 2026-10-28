import 'package:flutter/material.dart';

/// Represents a person shown in the Peoples tab.
class Person {
  const Person({
    required this.name,
    required this.role,
    required this.initials,
    required this.color,
    required this.isOnline,
  });

  final String name;
  final String role;
  final String initials;
  final Color color;
  final bool isOnline;
}

/// Contacts screen displayed in the Peoples tab.
class PeoplesView extends StatelessWidget {
  const PeoplesView({super.key});

  static const people = <Person>[
    Person(
      name: 'Ana García',
      role: 'Diseñadora UX',
      initials: 'AG',
      color: Color(0xFF7E57C2),
      isOnline: true,
    ),
    Person(
      name: 'Carlos Ruiz',
      role: 'Desarrollador Flutter',
      initials: 'CR',
      color: Color(0xFF42A5F5),
      isOnline: false,
    ),
    Person(
      name: 'Lucía Torres',
      role: 'Administradora de proyectos',
      initials: 'LT',
      color: Color(0xFF26A69A),
      isOnline: true,
    ),
    Person(
      name: 'Miguel Santos',
      role: 'Fotógrafo',
      initials: 'MS',
      color: Color(0xFFEF5350),
      isOnline: true,
    ),
    Person(
      name: 'Sofía Hernández',
      role: 'Ingeniera de software',
      initials: 'SH',
      color: Color(0xFFFFA726),
      isOnline: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: people.length,
      itemBuilder: (context, index) {
        final person = people[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 5,
          ),
          leading: Stack(
            children: [
              CircleAvatar(
                radius: 27,
                backgroundColor: person.color,
                child: Text(
                  person.initials,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (person.isOnline)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          title: Text(
            person.name,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(person.role),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          onTap: () {},
        );
      },
    );
  }
}
