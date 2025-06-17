import 'package:flutter/material.dart';

class FlipButton extends StatefulWidget {
  const FlipButton({super.key});

  @override
  State<FlipButton> createState() => _ScaleHeartButtonState();
}

class _ScaleHeartButtonState extends State<FlipButton>
    with SingleTickerProviderStateMixin {
  
  // Variáveis de controle da animação e estado
  late AnimationController _controller;  // Controla a duração e progresso da animação
  late Animation<double> _scaleAnimation; // Define como o tamanho vai mudar (de 1.0 para 0.8)
  bool isFavorite = false;               // Controla se está favoritado ou não

  // Inicialização da animação
  @override
  void initState() {
    super.initState();
    
    // Cria o controller que vai durar 200ms
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this, // Necessário para otimizar a animação
    );
    
    // Define a animação de escala:
    // - Começa em 1.0 (tamanho normal)
    // - Vai até 0.8 (80% do tamanho original - um pouco menor)
    // - Usa curva suave (easeInOut)
    _scaleAnimation = Tween<double>(
      begin: 1.0,  // Tamanho inicial (100%)
      end: 0.8,    // Tamanho quando "aperta" (80%)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  // Limpeza da memória quando widget é destruído
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Função que é chamada quando clica no botão
  void _toggleFavorite() {
    // Primeiro muda o estado (favorito/não favorito)
    setState(() {
      isFavorite = !isFavorite; // Inverte o valor atual
    });
    
    // Depois executa a animação:
    // 1. forward() = vai de 1.0 para 0.8 (diminui)
    // 2. quando termina, reverse() = volta de 0.8 para 1.0 (aumenta)
    _controller.forward().then((_) {
      _controller.reverse();
    });
  }

  // Construção da interface
  @override
  Widget build(BuildContext context) {
    // AnimatedBuilder reconstrói automaticamente quando a animação muda
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        // Transform.scale aplica a escala atual da animação
        return Transform.scale(
          scale: _scaleAnimation.value, // Valor atual da animação (entre 0.8 e 1.0)
          child: IconButton(
            onPressed: _toggleFavorite, // Chama nossa função quando clica
            icon: Icon(
              // Escolhe o ícone baseado no estado:
              isFavorite ? Icons.favorite : Icons.favorite_border,
              size: 25,
              // Escolhe a cor baseado no estado:
              color: isFavorite ? Colors.red : null, // null = cor padrão
            ),
          ),
        );
      },
    );
  }
}