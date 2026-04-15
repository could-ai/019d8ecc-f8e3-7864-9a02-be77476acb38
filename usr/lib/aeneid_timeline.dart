import 'package:flutter/material.dart';

class AeneidTimelineScreen extends StatelessWidget {
  const AeneidTimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Línea de Tiempo de la Eneida'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _timelineEvents.length,
        itemBuilder: (context, index) {
          final event = _timelineEvents[index];
          return TimelineTile(
            event: event,
            isFirst: index == 0,
            isLast: index == _timelineEvents.length - 1,
          );
        },
      ),
    );
  }
}

class TimelineEvent {
  final String title;
  final String description;
  final String book;
  final IconData icon;

  const TimelineEvent({
    required this.title,
    required this.description,
    required this.book,
    required this.icon,
  });
}

const List<TimelineEvent> _timelineEvents = [
  TimelineEvent(
    title: 'La Caída de Troya',
    description: 'Los griegos usan el Caballo de Madera para infiltrarse y destruir Troya. Eneas escapa con su padre Anquises, su hijo Ascanio y los Penates, aunque pierde a su esposa Creúsa.',
    book: 'Libro II (Flashback)',
    icon: Icons.local_fire_department,
  ),
  TimelineEvent(
    title: 'El Viaje Comienza',
    description: 'Los troyanos viajan por el Mediterráneo buscando una nueva patria. Se enfrentan a las Arpías, evitan a los Cíclopes y Anquises muere en Sicilia.',
    book: 'Libro III (Flashback)',
    icon: Icons.sailing,
  ),
  TimelineEvent(
    title: 'Tormenta y Llegada a Cartago',
    description: 'Juno provoca una gran tormenta que desvía a la flota troyana hacia Cartago. Allí son recibidos por la reina Dido.',
    book: 'Libro I',
    icon: Icons.thunderstorm,
  ),
  TimelineEvent(
    title: 'El Amor de Dido y Eneas',
    description: 'Dido se enamora perdidamente de Eneas. Sin embargo, Júpiter envía a Mercurio para recordarle a Eneas su destino en Italia. Eneas parte en secreto y Dido, desesperada, se suicida maldiciéndolo.',
    book: 'Libro IV',
    icon: Icons.favorite_border,
  ),
  TimelineEvent(
    title: 'Juegos Fúnebres en Sicilia',
    description: 'Los troyanos regresan a Sicilia y celebran juegos en honor al aniversario de la muerte de Anquises. Las mujeres troyanas, instigadas por Juno, queman parte de las naves.',
    book: 'Libro V',
    icon: Icons.emoji_events,
  ),
  TimelineEvent(
    title: 'Descenso al Inframundo',
    description: 'Eneas llega a Cumas y, guiado por la Sibila, desciende al Inframundo. Allí se reencuentra con Dido, quien lo ignora, y con su padre Anquises, quien le muestra el glorioso futuro de Roma.',
    book: 'Libro VI',
    icon: Icons.dark_mode,
  ),
  TimelineEvent(
    title: 'Llegada al Lacio y el Inicio de la Guerra',
    description: 'Los troyanos llegan a Italia. El rey Latino ofrece a su hija Lavinia en matrimonio a Eneas, pero Juno interviene, provocando la ira de Turno (prometido de Lavinia) y desatando la guerra.',
    book: 'Libro VII',
    icon: Icons.map,
  ),
  TimelineEvent(
    title: 'Alianzas y la Armadura de Vulcano',
    description: 'Eneas viaja por el río Tíber para buscar la alianza del rey Evandro. Venus le pide a Vulcano que forje una armadura divina para Eneas, cuyo escudo muestra la futura historia de Roma.',
    book: 'Libro VIII',
    icon: Icons.shield,
  ),
  TimelineEvent(
    title: 'El Ataque al Campamento Troyano',
    description: 'Aprovechando la ausencia de Eneas, Turno ataca el campamento troyano. Niso y Euríalo mueren en una trágica y heroica incursión nocturna.',
    book: 'Libro IX',
    icon: Icons.security,
  ),
  TimelineEvent(
    title: 'La Muerte de Palante',
    description: 'Eneas regresa con aliados. En la batalla, Turno mata al joven Palante, protegido de Eneas, y toma su cinturón como trofeo. Eneas entra en una furia implacable.',
    book: 'Libro X',
    icon: Icons.swords,
  ),
  TimelineEvent(
    title: 'Tregua y la Muerte de Camila',
    description: 'Se acuerda una breve tregua para enterrar a los muertos. La batalla se reanuda y la valiente guerrera virgen Camila muere luchando del lado de los latinos.',
    book: 'Libro XI',
    icon: Icons.nature_people,
  ),
  TimelineEvent(
    title: 'El Duelo Final',
    description: 'Eneas y Turno se enfrentan en un combate singular. Eneas hiere a Turno, quien pide piedad. Eneas duda, pero al ver el cinturón de Palante en el hombro de Turno, lo mata en venganza.',
    book: 'Libro XII',
    icon: Icons.sports_martial_arts,
  ),
];

class TimelineTile extends StatelessWidget {
  final TimelineEvent event;
  final bool isFirst;
  final bool isLast;

  const TimelineTile({
    super.key,
    required this.event,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Línea y nodo
          SizedBox(
            width: 40,
            child: Column(
              children: [
                // Línea superior
                Expanded(
                  child: Container(
                    width: 2,
                    color: isFirst ? Colors.transparent : Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  ),
                ),
                // Nodo
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    event.icon,
                    size: 16,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                // Línea inferior
                Expanded(
                  child: Container(
                    width: 2,
                    color: isLast ? Colors.transparent : Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Contenido de la tarjeta
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.book,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        event.title,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        event.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
