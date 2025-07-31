import 'package:flutter/material.dart';

class CertificateInputSection extends StatelessWidget {
  final TextEditingController certificateUrlController;

  const CertificateInputSection({
    super.key,
    required this.certificateUrlController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title with better hierarchy
        Row(
          children: [
            Icon(
              Icons.verified_outlined,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Text(
              'Certificate',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Optional',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 8),
        Text(
          'Add a link to your official certificate or score report',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        
        const SizedBox(height: 12),
        
        TextFormField(
          controller: certificateUrlController,
          decoration: InputDecoration(
            labelText: 'Certificate URL',
            hintText: 'https://example.com/certificate.pdf',
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.7),
              fontSize: 14,
            ),
            prefixIcon: Icon(
              Icons.link,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            helperText: 'Link to PDF, image, or online score report',
            helperStyle: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 12,
            ),
          ),
          keyboardType: TextInputType.url,
          validator: (value) {
            if (value != null && value.trim().isNotEmpty) {
              final uri = Uri.tryParse(value.trim());
              if (uri == null || !uri.hasScheme) {
                return 'Please enter a valid URL';
              }
              if (!['http', 'https'].contains(uri.scheme)) {
                return 'URL must start with http:// or https://';
              }
            }
            return null;
          },
        ),
      ],
    );
  }
}
