# Helitom Araujo — link na bio

Site estático de uma página: HTML, CSS e JavaScript puros, sem framework e sem backend.

- **Rolagem suave:** [Lenis](https://github.com/darkroomengineering/lenis) 1.1.13 (MIT), salvo em `assets/vendor/`. Não depende de CDN.
- **Fontes:** Google Fonts (Inter Tight e Outfit), carregadas por `fonts.googleapis.com`. Também há fontes de reserva definidas.
- **Imagens:** todas ficam em `assets/img/`.
- **Conteúdo editável:** textos PT/EN, logos, capas, links e redes ficam no bloco `<script type="application/json" id="site-data">` dentro do `index.html`.

## Estrutura

```
helitom-araujo-site/
├── index.html                  página completa (estilos e scripts embutidos)
├── favicon.svg
├── assets/
│   ├── img/
│   │   ├── photo.jpg           foto principal
│   │   ├── avatar.jpg          foto da base inferior
│   │   ├── contact-photo.webp  silhueta do bloco Contato
│   │   ├── covers/             capas do carrossel (1290×1580 de origem)
│   │   ├── logos/              logos que passam no trilho
│   │   └── behance/            miniaturas do bloco Portfólio em 3D
│   └── vendor/
│       ├── lenis.min.js
│       └── LENIS-LICENSE.txt
├── scripts/
│   ├── check.sh                confere se todo arquivo citado existe
│   └── build.sh                gera dist/
├── package.json
├── vercel.json
└── .gitignore
```

## Comandos

Requisito: Node.js 18 ou mais novo (só para `dev` e `preview`; o build usa apenas `sh`).

```bash
npm install
```
Não há dependências para instalar. O comando só cria o `package-lock.json`.

```bash
npm run dev
```
Abre em http://localhost:3000 (usa `serve` via npx; precisa de internet na primeira vez).

```bash
npm run build
```
Valida as referências e gera a pasta `dist/` para publicação.

```bash
npm run preview
```
Serve a pasta `dist/` em http://localhost:4173.

Sem Node, qualquer servidor estático funciona, por exemplo `python3 -m http.server 3000` ou `ruby -run -e httpd . -p 3000` dentro da pasta.

Abrir o `index.html` direto pelo Finder (file://) também funciona na maioria dos navegadores, mas prefira um servidor local para testar como em produção.

## Publicar na Vercel

**Pelo site (com GitHub):**
1. Crie um repositório no GitHub e envie esta pasta.
2. Em vercel.com → **Add New… → Project**, importe o repositório.
3. A Vercel lê o `vercel.json`: Framework **Other**, Build Command `sh scripts/build.sh`, Output Directory `dist`. Não mude nada.
4. Clique em **Deploy**.

**Pela linha de comando:**
```bash
npx vercel
```
Na primeira vez ele pede login e confirma as configurações. Para publicar em produção:
```bash
npx vercel --prod
```

**Domínio próprio:** em Project → Settings → Domains, adicione o domínio e siga as instruções de DNS.

Outras hospedagens estáticas (Netlify, Cloudflare Pages, GitHub Pages) também servem: build `sh scripts/build.sh`, pasta publicada `dist`.

## Antes de divulgar

- WhatsApp: troque `https://wa.me/5500000000000` pelo seu número (`https://wa.me/55` + DDD + número).
- LinkedIn: `https://www.linkedin.com/feed/` abre o feed de quem clica; use o link do perfil (`https://www.linkedin.com/in/...`).
- X: está em `https://x.com/` até a conta existir.
- Projetos do carrossel: os 4 links apontam para o perfil do Behance; troque pelos links de cada post.
