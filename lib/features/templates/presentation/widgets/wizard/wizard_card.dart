//lib/features/templates/presentation/widgets/wizard/wizard_card.dart
import 'package:flutter/material.dart';

class WizardCard extends StatelessWidget {
  final int step;
  final String title;
  final Widget child;

  const WizardCard({
    super.key,
    required this.step,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'STEP $step OF 3',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          // The child is wrapped in Expanded to allow it to fill the remaining space.
          // This is necessary for widgets like ListView or Column with Expanded children.
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}