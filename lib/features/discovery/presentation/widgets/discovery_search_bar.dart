import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Search bar component with modern design
class DiscoverySearchBar extends ConsumerStatefulWidget {
  final String? initialQuery;
  final Function(String) onSearchChanged;
  final Function()? onFilterTap;
  final bool hasActiveFilters;

  const DiscoverySearchBar({
    super.key,
    this.initialQuery,
    required this.onSearchChanged,
    this.onFilterTap,
    this.hasActiveFilters = false,
  });

  @override
  ConsumerState<DiscoverySearchBar> createState() => _DiscoverySearchBarState();
}

class _DiscoverySearchBarState extends ConsumerState<DiscoverySearchBar> {
  late final TextEditingController _controller;
  bool _isSearchActive = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialQuery);
    _isSearchActive = widget.initialQuery?.isNotEmpty ?? false;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _isSearchActive 
                      ? theme.colorScheme.primary
                      : Colors.transparent,
                ),
              ),
              child: TextField(
                controller: _controller,
                onChanged: (value) {
                  setState(() {
                    _isSearchActive = value.isNotEmpty;
                  });
                  widget.onSearchChanged(value);
                },
                decoration: InputDecoration(
                  hintText: 'Search scholarships...',
                  hintStyle: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: _isSearchActive 
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                  suffixIcon: _isSearchActive 
                      ? IconButton(
                          onPressed: () {
                            _controller.clear();
                            setState(() {
                              _isSearchActive = false;
                            });
                            widget.onSearchChanged('');
                          },
                          icon: Icon(
                            Icons.clear,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ),
          
          if (widget.onFilterTap != null) ...[
            const SizedBox(width: 12),
            Container(
              decoration: BoxDecoration(
                color: widget.hasActiveFilters 
                    ? theme.colorScheme.primary
                    : theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: widget.hasActiveFilters 
                      ? theme.colorScheme.primary
                      : theme.colorScheme.outline.withOpacity(0.3),
                ),
              ),
              child: IconButton(
                onPressed: widget.onFilterTap,
                icon: Stack(
                  children: [
                    Icon(
                      Icons.tune,
                      color: widget.hasActiveFilters 
                          ? theme.colorScheme.onPrimary
                          : theme.colorScheme.onSurfaceVariant,
                    ),
                    if (widget.hasActiveFilters)
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.error,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
