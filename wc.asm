
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	be 01 00 00 00       	mov    $0x1,%esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	83 ec 18             	sub    $0x18,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 59 04             	mov    0x4(%ecx),%ebx
  1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  21:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  24:	83 f8 01             	cmp    $0x1,%eax
  27:	7e 56                	jle    7f <main+0x7f>
  29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	pushl  (%ebx)
  37:	e8 d7 03 00 00       	call   413 <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	89 c7                	mov    %eax,%edi
  41:	85 c0                	test   %eax,%eax
  43:	78 26                	js     6b <main+0x6b>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  45:	83 ec 08             	sub    $0x8,%esp
  48:	ff 33                	pushl  (%ebx)
  for(i = 1; i < argc; i++){
  4a:	83 c6 01             	add    $0x1,%esi
  4d:	83 c3 04             	add    $0x4,%ebx
    wc(fd, argv[i]);
  50:	50                   	push   %eax
  51:	e8 4a 00 00 00       	call   a0 <wc>
    close(fd);
  56:	89 3c 24             	mov    %edi,(%esp)
  59:	e8 9d 03 00 00       	call   3fb <close>
  for(i = 1; i < argc; i++){
  5e:	83 c4 10             	add    $0x10,%esp
  61:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  64:	75 ca                	jne    30 <main+0x30>
  }
  exit();
  66:	e8 68 03 00 00       	call   3d3 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  6b:	50                   	push   %eax
  6c:	ff 33                	pushl  (%ebx)
  6e:	68 17 0a 00 00       	push   $0xa17
  73:	6a 01                	push   $0x1
  75:	e8 b6 04 00 00       	call   530 <printf>
      exit();
  7a:	e8 54 03 00 00       	call   3d3 <exit>
    wc(0, "");
  7f:	52                   	push   %edx
  80:	52                   	push   %edx
  81:	68 55 0a 00 00       	push   $0xa55
  86:	6a 00                	push   $0x0
  88:	e8 13 00 00 00       	call   a0 <wc>
    exit();
  8d:	e8 41 03 00 00       	call   3d3 <exit>
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <wc>:
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	57                   	push   %edi
  a4:	56                   	push   %esi
  a5:	53                   	push   %ebx
  l = w = c = 0;
  a6:	31 db                	xor    %ebx,%ebx
{
  a8:	83 ec 1c             	sub    $0x1c,%esp
  inword = 0;
  ab:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
  b2:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  b9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c0:	83 ec 04             	sub    $0x4,%esp
  c3:	68 00 02 00 00       	push   $0x200
  c8:	68 e0 0d 00 00       	push   $0xde0
  cd:	ff 75 08             	pushl  0x8(%ebp)
  d0:	e8 16 03 00 00       	call   3eb <read>
  d5:	83 c4 10             	add    $0x10,%esp
  d8:	89 c6                	mov    %eax,%esi
  da:	85 c0                	test   %eax,%eax
  dc:	7e 62                	jle    140 <wc+0xa0>
    for(i=0; i<n; i++){
  de:	31 ff                	xor    %edi,%edi
  e0:	eb 14                	jmp    f6 <wc+0x56>
  e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        inword = 0;
  e8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
  ef:	83 c7 01             	add    $0x1,%edi
  f2:	39 fe                	cmp    %edi,%esi
  f4:	74 42                	je     138 <wc+0x98>
      if(buf[i] == '\n')
  f6:	0f be 87 e0 0d 00 00 	movsbl 0xde0(%edi),%eax
        l++;
  fd:	31 c9                	xor    %ecx,%ecx
  ff:	3c 0a                	cmp    $0xa,%al
 101:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 104:	83 ec 08             	sub    $0x8,%esp
 107:	50                   	push   %eax
        l++;
 108:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 10a:	68 f4 09 00 00       	push   $0x9f4
 10f:	e8 3c 01 00 00       	call   250 <strchr>
 114:	83 c4 10             	add    $0x10,%esp
 117:	85 c0                	test   %eax,%eax
 119:	75 cd                	jne    e8 <wc+0x48>
      else if(!inword){
 11b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 11e:	85 d2                	test   %edx,%edx
 120:	75 cd                	jne    ef <wc+0x4f>
    for(i=0; i<n; i++){
 122:	83 c7 01             	add    $0x1,%edi
        w++;
 125:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        inword = 1;
 129:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
 130:	39 fe                	cmp    %edi,%esi
 132:	75 c2                	jne    f6 <wc+0x56>
 134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 138:	01 75 dc             	add    %esi,-0x24(%ebp)
 13b:	eb 83                	jmp    c0 <wc+0x20>
 13d:	8d 76 00             	lea    0x0(%esi),%esi
  if(n < 0){
 140:	75 24                	jne    166 <wc+0xc6>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 142:	83 ec 08             	sub    $0x8,%esp
 145:	ff 75 0c             	pushl  0xc(%ebp)
 148:	ff 75 dc             	pushl  -0x24(%ebp)
 14b:	ff 75 e0             	pushl  -0x20(%ebp)
 14e:	53                   	push   %ebx
 14f:	68 0a 0a 00 00       	push   $0xa0a
 154:	6a 01                	push   $0x1
 156:	e8 d5 03 00 00       	call   530 <printf>
}
 15b:	83 c4 20             	add    $0x20,%esp
 15e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 161:	5b                   	pop    %ebx
 162:	5e                   	pop    %esi
 163:	5f                   	pop    %edi
 164:	5d                   	pop    %ebp
 165:	c3                   	ret    
    printf(1, "wc: read error\n");
 166:	50                   	push   %eax
 167:	50                   	push   %eax
 168:	68 fa 09 00 00       	push   $0x9fa
 16d:	6a 01                	push   $0x1
 16f:	e8 bc 03 00 00       	call   530 <printf>
    exit();
 174:	e8 5a 02 00 00       	call   3d3 <exit>
 179:	66 90                	xchg   %ax,%ax
 17b:	66 90                	xchg   %ax,%ax
 17d:	66 90                	xchg   %ax,%ax
 17f:	90                   	nop

00000180 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 180:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 181:	31 c0                	xor    %eax,%eax
{
 183:	89 e5                	mov    %esp,%ebp
 185:	53                   	push   %ebx
 186:	8b 4d 08             	mov    0x8(%ebp),%ecx
 189:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 190:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 194:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 197:	83 c0 01             	add    $0x1,%eax
 19a:	84 d2                	test   %dl,%dl
 19c:	75 f2                	jne    190 <strcpy+0x10>
    ;
  return os;
}
 19e:	89 c8                	mov    %ecx,%eax
 1a0:	5b                   	pop    %ebx
 1a1:	5d                   	pop    %ebp
 1a2:	c3                   	ret    
 1a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	53                   	push   %ebx
 1b4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1b7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1ba:	0f b6 01             	movzbl (%ecx),%eax
 1bd:	0f b6 1a             	movzbl (%edx),%ebx
 1c0:	84 c0                	test   %al,%al
 1c2:	75 1d                	jne    1e1 <strcmp+0x31>
 1c4:	eb 2a                	jmp    1f0 <strcmp+0x40>
 1c6:	8d 76 00             	lea    0x0(%esi),%esi
 1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 1d0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 1d4:	83 c1 01             	add    $0x1,%ecx
 1d7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1da:	0f b6 1a             	movzbl (%edx),%ebx
 1dd:	84 c0                	test   %al,%al
 1df:	74 0f                	je     1f0 <strcmp+0x40>
 1e1:	38 d8                	cmp    %bl,%al
 1e3:	74 eb                	je     1d0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1e5:	29 d8                	sub    %ebx,%eax
}
 1e7:	5b                   	pop    %ebx
 1e8:	5d                   	pop    %ebp
 1e9:	c3                   	ret    
 1ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1f0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1f2:	29 d8                	sub    %ebx,%eax
}
 1f4:	5b                   	pop    %ebx
 1f5:	5d                   	pop    %ebp
 1f6:	c3                   	ret    
 1f7:	89 f6                	mov    %esi,%esi
 1f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000200 <strlen>:

uint
strlen(const char *s)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 206:	80 3a 00             	cmpb   $0x0,(%edx)
 209:	74 15                	je     220 <strlen+0x20>
 20b:	31 c0                	xor    %eax,%eax
 20d:	8d 76 00             	lea    0x0(%esi),%esi
 210:	83 c0 01             	add    $0x1,%eax
 213:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 217:	89 c1                	mov    %eax,%ecx
 219:	75 f5                	jne    210 <strlen+0x10>
    ;
  return n;
}
 21b:	89 c8                	mov    %ecx,%eax
 21d:	5d                   	pop    %ebp
 21e:	c3                   	ret    
 21f:	90                   	nop
  for(n = 0; s[n]; n++)
 220:	31 c9                	xor    %ecx,%ecx
}
 222:	5d                   	pop    %ebp
 223:	89 c8                	mov    %ecx,%eax
 225:	c3                   	ret    
 226:	8d 76 00             	lea    0x0(%esi),%esi
 229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000230 <memset>:

void*
memset(void *dst, int c, uint n)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 237:	8b 4d 10             	mov    0x10(%ebp),%ecx
 23a:	8b 45 0c             	mov    0xc(%ebp),%eax
 23d:	89 d7                	mov    %edx,%edi
 23f:	fc                   	cld    
 240:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 242:	89 d0                	mov    %edx,%eax
 244:	5f                   	pop    %edi
 245:	5d                   	pop    %ebp
 246:	c3                   	ret    
 247:	89 f6                	mov    %esi,%esi
 249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000250 <strchr>:

char*
strchr(const char *s, char c)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	8b 45 08             	mov    0x8(%ebp),%eax
 256:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 25a:	0f b6 10             	movzbl (%eax),%edx
 25d:	84 d2                	test   %dl,%dl
 25f:	75 12                	jne    273 <strchr+0x23>
 261:	eb 1d                	jmp    280 <strchr+0x30>
 263:	90                   	nop
 264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 268:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 26c:	83 c0 01             	add    $0x1,%eax
 26f:	84 d2                	test   %dl,%dl
 271:	74 0d                	je     280 <strchr+0x30>
    if(*s == c)
 273:	38 d1                	cmp    %dl,%cl
 275:	75 f1                	jne    268 <strchr+0x18>
      return (char*)s;
  return 0;
}
 277:	5d                   	pop    %ebp
 278:	c3                   	ret    
 279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 280:	31 c0                	xor    %eax,%eax
}
 282:	5d                   	pop    %ebp
 283:	c3                   	ret    
 284:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 28a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000290 <gets>:

char*
gets(char *buf, int max)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 295:	31 f6                	xor    %esi,%esi
{
 297:	53                   	push   %ebx
 298:	89 f3                	mov    %esi,%ebx
 29a:	83 ec 1c             	sub    $0x1c,%esp
 29d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 2a0:	eb 2f                	jmp    2d1 <gets+0x41>
 2a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 2a8:	83 ec 04             	sub    $0x4,%esp
 2ab:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2ae:	6a 01                	push   $0x1
 2b0:	50                   	push   %eax
 2b1:	6a 00                	push   $0x0
 2b3:	e8 33 01 00 00       	call   3eb <read>
    if(cc < 1)
 2b8:	83 c4 10             	add    $0x10,%esp
 2bb:	85 c0                	test   %eax,%eax
 2bd:	7e 1c                	jle    2db <gets+0x4b>
      break;
    buf[i++] = c;
 2bf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2c3:	83 c7 01             	add    $0x1,%edi
 2c6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 2c9:	3c 0a                	cmp    $0xa,%al
 2cb:	74 23                	je     2f0 <gets+0x60>
 2cd:	3c 0d                	cmp    $0xd,%al
 2cf:	74 1f                	je     2f0 <gets+0x60>
  for(i=0; i+1 < max; ){
 2d1:	83 c3 01             	add    $0x1,%ebx
 2d4:	89 fe                	mov    %edi,%esi
 2d6:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2d9:	7c cd                	jl     2a8 <gets+0x18>
 2db:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 2dd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2e0:	c6 03 00             	movb   $0x0,(%ebx)
}
 2e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2e6:	5b                   	pop    %ebx
 2e7:	5e                   	pop    %esi
 2e8:	5f                   	pop    %edi
 2e9:	5d                   	pop    %ebp
 2ea:	c3                   	ret    
 2eb:	90                   	nop
 2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2f0:	8b 75 08             	mov    0x8(%ebp),%esi
 2f3:	8b 45 08             	mov    0x8(%ebp),%eax
 2f6:	01 de                	add    %ebx,%esi
 2f8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2fa:	c6 03 00             	movb   $0x0,(%ebx)
}
 2fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 300:	5b                   	pop    %ebx
 301:	5e                   	pop    %esi
 302:	5f                   	pop    %edi
 303:	5d                   	pop    %ebp
 304:	c3                   	ret    
 305:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000310 <stat>:

int
stat(const char *n, struct stat *st)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	56                   	push   %esi
 314:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 315:	83 ec 08             	sub    $0x8,%esp
 318:	6a 00                	push   $0x0
 31a:	ff 75 08             	pushl  0x8(%ebp)
 31d:	e8 f1 00 00 00       	call   413 <open>
  if(fd < 0)
 322:	83 c4 10             	add    $0x10,%esp
 325:	85 c0                	test   %eax,%eax
 327:	78 27                	js     350 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 329:	83 ec 08             	sub    $0x8,%esp
 32c:	ff 75 0c             	pushl  0xc(%ebp)
 32f:	89 c3                	mov    %eax,%ebx
 331:	50                   	push   %eax
 332:	e8 f4 00 00 00       	call   42b <fstat>
  close(fd);
 337:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 33a:	89 c6                	mov    %eax,%esi
  close(fd);
 33c:	e8 ba 00 00 00       	call   3fb <close>
  return r;
 341:	83 c4 10             	add    $0x10,%esp
}
 344:	8d 65 f8             	lea    -0x8(%ebp),%esp
 347:	89 f0                	mov    %esi,%eax
 349:	5b                   	pop    %ebx
 34a:	5e                   	pop    %esi
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret    
 34d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 350:	be ff ff ff ff       	mov    $0xffffffff,%esi
 355:	eb ed                	jmp    344 <stat+0x34>
 357:	89 f6                	mov    %esi,%esi
 359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000360 <atoi>:

int
atoi(const char *s)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
 364:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 367:	0f be 02             	movsbl (%edx),%eax
 36a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 36d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 370:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 375:	77 1e                	ja     395 <atoi+0x35>
 377:	89 f6                	mov    %esi,%esi
 379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 380:	83 c2 01             	add    $0x1,%edx
 383:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 386:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 38a:	0f be 02             	movsbl (%edx),%eax
 38d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 390:	80 fb 09             	cmp    $0x9,%bl
 393:	76 eb                	jbe    380 <atoi+0x20>
  return n;
}
 395:	89 c8                	mov    %ecx,%eax
 397:	5b                   	pop    %ebx
 398:	5d                   	pop    %ebp
 399:	c3                   	ret    
 39a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	57                   	push   %edi
 3a4:	8b 45 10             	mov    0x10(%ebp),%eax
 3a7:	8b 55 08             	mov    0x8(%ebp),%edx
 3aa:	56                   	push   %esi
 3ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3ae:	85 c0                	test   %eax,%eax
 3b0:	7e 13                	jle    3c5 <memmove+0x25>
 3b2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3b4:	89 d7                	mov    %edx,%edi
 3b6:	8d 76 00             	lea    0x0(%esi),%esi
 3b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    *dst++ = *src++;
 3c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3c1:	39 f8                	cmp    %edi,%eax
 3c3:	75 fb                	jne    3c0 <memmove+0x20>
  return vdst;
}
 3c5:	5e                   	pop    %esi
 3c6:	89 d0                	mov    %edx,%eax
 3c8:	5f                   	pop    %edi
 3c9:	5d                   	pop    %ebp
 3ca:	c3                   	ret    

000003cb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3cb:	b8 01 00 00 00       	mov    $0x1,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <exit>:
SYSCALL(exit)
 3d3:	b8 02 00 00 00       	mov    $0x2,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <wait>:
SYSCALL(wait)
 3db:	b8 03 00 00 00       	mov    $0x3,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <pipe>:
SYSCALL(pipe)
 3e3:	b8 04 00 00 00       	mov    $0x4,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <read>:
SYSCALL(read)
 3eb:	b8 05 00 00 00       	mov    $0x5,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <write>:
SYSCALL(write)
 3f3:	b8 10 00 00 00       	mov    $0x10,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <close>:
SYSCALL(close)
 3fb:	b8 15 00 00 00       	mov    $0x15,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <kill>:
SYSCALL(kill)
 403:	b8 06 00 00 00       	mov    $0x6,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <exec>:
SYSCALL(exec)
 40b:	b8 07 00 00 00       	mov    $0x7,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <open>:
SYSCALL(open)
 413:	b8 0f 00 00 00       	mov    $0xf,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <mknod>:
SYSCALL(mknod)
 41b:	b8 11 00 00 00       	mov    $0x11,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <unlink>:
SYSCALL(unlink)
 423:	b8 12 00 00 00       	mov    $0x12,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <fstat>:
SYSCALL(fstat)
 42b:	b8 08 00 00 00       	mov    $0x8,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <link>:
SYSCALL(link)
 433:	b8 13 00 00 00       	mov    $0x13,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <mkdir>:
SYSCALL(mkdir)
 43b:	b8 14 00 00 00       	mov    $0x14,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <chdir>:
SYSCALL(chdir)
 443:	b8 09 00 00 00       	mov    $0x9,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <dup>:
SYSCALL(dup)
 44b:	b8 0a 00 00 00       	mov    $0xa,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <getpid>:
SYSCALL(getpid)
 453:	b8 0b 00 00 00       	mov    $0xb,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <sbrk>:
SYSCALL(sbrk)
 45b:	b8 0c 00 00 00       	mov    $0xc,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <sleep>:
SYSCALL(sleep)
 463:	b8 0d 00 00 00       	mov    $0xd,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <uptime>:
SYSCALL(uptime)
 46b:	b8 0e 00 00 00       	mov    $0xe,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <walkpt>:
SYSCALL(walkpt)
 473:	b8 16 00 00 00       	mov    $0x16,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    
 47b:	66 90                	xchg   %ax,%ax
 47d:	66 90                	xchg   %ax,%ax
 47f:	90                   	nop

00000480 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	56                   	push   %esi
 485:	53                   	push   %ebx
 486:	83 ec 3c             	sub    $0x3c,%esp
 489:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 48c:	89 d1                	mov    %edx,%ecx
{
 48e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 491:	85 d2                	test   %edx,%edx
 493:	0f 89 7f 00 00 00    	jns    518 <printint+0x98>
 499:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 49d:	74 79                	je     518 <printint+0x98>
    neg = 1;
 49f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 4a6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 4a8:	31 db                	xor    %ebx,%ebx
 4aa:	8d 75 d7             	lea    -0x29(%ebp),%esi
 4ad:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 4b0:	89 c8                	mov    %ecx,%eax
 4b2:	31 d2                	xor    %edx,%edx
 4b4:	89 cf                	mov    %ecx,%edi
 4b6:	f7 75 c4             	divl   -0x3c(%ebp)
 4b9:	0f b6 92 34 0a 00 00 	movzbl 0xa34(%edx),%edx
 4c0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 4c3:	89 d8                	mov    %ebx,%eax
 4c5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 4c8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 4cb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 4ce:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 4d1:	76 dd                	jbe    4b0 <printint+0x30>
  if(neg)
 4d3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 4d6:	85 c9                	test   %ecx,%ecx
 4d8:	74 0c                	je     4e6 <printint+0x66>
    buf[i++] = '-';
 4da:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 4df:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 4e1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 4e6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 4e9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 4ed:	eb 07                	jmp    4f6 <printint+0x76>
 4ef:	90                   	nop
 4f0:	0f b6 13             	movzbl (%ebx),%edx
 4f3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 4f6:	83 ec 04             	sub    $0x4,%esp
 4f9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 4fc:	6a 01                	push   $0x1
 4fe:	56                   	push   %esi
 4ff:	57                   	push   %edi
 500:	e8 ee fe ff ff       	call   3f3 <write>
  while(--i >= 0)
 505:	83 c4 10             	add    $0x10,%esp
 508:	39 de                	cmp    %ebx,%esi
 50a:	75 e4                	jne    4f0 <printint+0x70>
    putc(fd, buf[i]);
}
 50c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 50f:	5b                   	pop    %ebx
 510:	5e                   	pop    %esi
 511:	5f                   	pop    %edi
 512:	5d                   	pop    %ebp
 513:	c3                   	ret    
 514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 518:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 51f:	eb 87                	jmp    4a8 <printint+0x28>
 521:	eb 0d                	jmp    530 <printf>
 523:	90                   	nop
 524:	90                   	nop
 525:	90                   	nop
 526:	90                   	nop
 527:	90                   	nop
 528:	90                   	nop
 529:	90                   	nop
 52a:	90                   	nop
 52b:	90                   	nop
 52c:	90                   	nop
 52d:	90                   	nop
 52e:	90                   	nop
 52f:	90                   	nop

00000530 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	57                   	push   %edi
 534:	56                   	push   %esi
 535:	53                   	push   %ebx
 536:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 539:	8b 75 0c             	mov    0xc(%ebp),%esi
 53c:	0f b6 1e             	movzbl (%esi),%ebx
 53f:	84 db                	test   %bl,%bl
 541:	0f 84 b8 00 00 00    	je     5ff <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 547:	8d 45 10             	lea    0x10(%ebp),%eax
 54a:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 54d:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 550:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 552:	89 45 d0             	mov    %eax,-0x30(%ebp)
 555:	eb 37                	jmp    58e <printf+0x5e>
 557:	89 f6                	mov    %esi,%esi
 559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 560:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 563:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 568:	83 f8 25             	cmp    $0x25,%eax
 56b:	74 17                	je     584 <printf+0x54>
  write(fd, &c, 1);
 56d:	83 ec 04             	sub    $0x4,%esp
 570:	88 5d e7             	mov    %bl,-0x19(%ebp)
 573:	6a 01                	push   $0x1
 575:	57                   	push   %edi
 576:	ff 75 08             	pushl  0x8(%ebp)
 579:	e8 75 fe ff ff       	call   3f3 <write>
 57e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 581:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 584:	0f b6 1e             	movzbl (%esi),%ebx
 587:	83 c6 01             	add    $0x1,%esi
 58a:	84 db                	test   %bl,%bl
 58c:	74 71                	je     5ff <printf+0xcf>
    c = fmt[i] & 0xff;
 58e:	0f be cb             	movsbl %bl,%ecx
 591:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 594:	85 d2                	test   %edx,%edx
 596:	74 c8                	je     560 <printf+0x30>
      }
    } else if(state == '%'){
 598:	83 fa 25             	cmp    $0x25,%edx
 59b:	75 e7                	jne    584 <printf+0x54>
      if(c == 'd'){
 59d:	83 f8 64             	cmp    $0x64,%eax
 5a0:	0f 84 9a 00 00 00    	je     640 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5a6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 5ac:	83 f9 70             	cmp    $0x70,%ecx
 5af:	74 5f                	je     610 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5b1:	83 f8 73             	cmp    $0x73,%eax
 5b4:	0f 84 d6 00 00 00    	je     690 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5ba:	83 f8 63             	cmp    $0x63,%eax
 5bd:	0f 84 8d 00 00 00    	je     650 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5c3:	83 f8 25             	cmp    $0x25,%eax
 5c6:	0f 84 b4 00 00 00    	je     680 <printf+0x150>
  write(fd, &c, 1);
 5cc:	83 ec 04             	sub    $0x4,%esp
 5cf:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5d3:	6a 01                	push   $0x1
 5d5:	57                   	push   %edi
 5d6:	ff 75 08             	pushl  0x8(%ebp)
 5d9:	e8 15 fe ff ff       	call   3f3 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 5de:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 5e1:	83 c4 0c             	add    $0xc,%esp
 5e4:	6a 01                	push   $0x1
 5e6:	83 c6 01             	add    $0x1,%esi
 5e9:	57                   	push   %edi
 5ea:	ff 75 08             	pushl  0x8(%ebp)
 5ed:	e8 01 fe ff ff       	call   3f3 <write>
  for(i = 0; fmt[i]; i++){
 5f2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 5f6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 5f9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 5fb:	84 db                	test   %bl,%bl
 5fd:	75 8f                	jne    58e <printf+0x5e>
    }
  }
}
 5ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
 602:	5b                   	pop    %ebx
 603:	5e                   	pop    %esi
 604:	5f                   	pop    %edi
 605:	5d                   	pop    %ebp
 606:	c3                   	ret    
 607:	89 f6                	mov    %esi,%esi
 609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        printint(fd, *ap, 16, 0);
 610:	83 ec 0c             	sub    $0xc,%esp
 613:	b9 10 00 00 00       	mov    $0x10,%ecx
 618:	6a 00                	push   $0x0
 61a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 61d:	8b 45 08             	mov    0x8(%ebp),%eax
 620:	8b 13                	mov    (%ebx),%edx
 622:	e8 59 fe ff ff       	call   480 <printint>
        ap++;
 627:	89 d8                	mov    %ebx,%eax
 629:	83 c4 10             	add    $0x10,%esp
      state = 0;
 62c:	31 d2                	xor    %edx,%edx
        ap++;
 62e:	83 c0 04             	add    $0x4,%eax
 631:	89 45 d0             	mov    %eax,-0x30(%ebp)
 634:	e9 4b ff ff ff       	jmp    584 <printf+0x54>
 639:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 640:	83 ec 0c             	sub    $0xc,%esp
 643:	b9 0a 00 00 00       	mov    $0xa,%ecx
 648:	6a 01                	push   $0x1
 64a:	eb ce                	jmp    61a <printf+0xea>
 64c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 650:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 653:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 656:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 658:	6a 01                	push   $0x1
        ap++;
 65a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 65d:	57                   	push   %edi
 65e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 661:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 664:	e8 8a fd ff ff       	call   3f3 <write>
        ap++;
 669:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 66c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 66f:	31 d2                	xor    %edx,%edx
 671:	e9 0e ff ff ff       	jmp    584 <printf+0x54>
 676:	8d 76 00             	lea    0x0(%esi),%esi
 679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        putc(fd, c);
 680:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 683:	83 ec 04             	sub    $0x4,%esp
 686:	e9 59 ff ff ff       	jmp    5e4 <printf+0xb4>
 68b:	90                   	nop
 68c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 690:	8b 45 d0             	mov    -0x30(%ebp),%eax
 693:	8b 18                	mov    (%eax),%ebx
        ap++;
 695:	83 c0 04             	add    $0x4,%eax
 698:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 69b:	85 db                	test   %ebx,%ebx
 69d:	74 17                	je     6b6 <printf+0x186>
        while(*s != 0){
 69f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 6a2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 6a4:	84 c0                	test   %al,%al
 6a6:	0f 84 d8 fe ff ff    	je     584 <printf+0x54>
 6ac:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 6af:	89 de                	mov    %ebx,%esi
 6b1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6b4:	eb 1a                	jmp    6d0 <printf+0x1a0>
          s = "(null)";
 6b6:	bb 2b 0a 00 00       	mov    $0xa2b,%ebx
        while(*s != 0){
 6bb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 6be:	b8 28 00 00 00       	mov    $0x28,%eax
 6c3:	89 de                	mov    %ebx,%esi
 6c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6c8:	90                   	nop
 6c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 6d0:	83 ec 04             	sub    $0x4,%esp
          s++;
 6d3:	83 c6 01             	add    $0x1,%esi
 6d6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6d9:	6a 01                	push   $0x1
 6db:	57                   	push   %edi
 6dc:	53                   	push   %ebx
 6dd:	e8 11 fd ff ff       	call   3f3 <write>
        while(*s != 0){
 6e2:	0f b6 06             	movzbl (%esi),%eax
 6e5:	83 c4 10             	add    $0x10,%esp
 6e8:	84 c0                	test   %al,%al
 6ea:	75 e4                	jne    6d0 <printf+0x1a0>
 6ec:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 6ef:	31 d2                	xor    %edx,%edx
 6f1:	e9 8e fe ff ff       	jmp    584 <printf+0x54>
 6f6:	66 90                	xchg   %ax,%ax
 6f8:	66 90                	xchg   %ax,%ax
 6fa:	66 90                	xchg   %ax,%ax
 6fc:	66 90                	xchg   %ax,%ax
 6fe:	66 90                	xchg   %ax,%ax

00000700 <print_free_list>:
static Header base;
static Header *freep;

// print free list status
void
print_free_list(){
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	53                   	push   %ebx
 704:	83 ec 0c             	sub    $0xc,%esp
  Header* p;
  printf(1, "Header -> ");
 707:	68 45 0a 00 00       	push   $0xa45
 70c:	6a 01                	push   $0x1
 70e:	e8 1d fe ff ff       	call   530 <printf>
  if(freep == 0){ 
 713:	a1 c0 0d 00 00       	mov    0xdc0,%eax
 718:	83 c4 10             	add    $0x10,%esp
 71b:	85 c0                	test   %eax,%eax
 71d:	74 30                	je     74f <print_free_list+0x4f>
    printf(1, "NULL\n");
    return;
  }
  for(p = base.s.ptr; p != &base; p = p->s.ptr){
 71f:	8b 1d c4 0d 00 00    	mov    0xdc4,%ebx
 725:	81 fb c4 0d 00 00    	cmp    $0xdc4,%ebx
 72b:	74 22                	je     74f <print_free_list+0x4f>
 72d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%d -> ", p->s.size);
 730:	83 ec 04             	sub    $0x4,%esp
 733:	ff 73 04             	pushl  0x4(%ebx)
 736:	68 56 0a 00 00       	push   $0xa56
 73b:	6a 01                	push   $0x1
 73d:	e8 ee fd ff ff       	call   530 <printf>
  for(p = base.s.ptr; p != &base; p = p->s.ptr){
 742:	8b 1b                	mov    (%ebx),%ebx
 744:	83 c4 10             	add    $0x10,%esp
 747:	81 fb c4 0d 00 00    	cmp    $0xdc4,%ebx
 74d:	75 e1                	jne    730 <print_free_list+0x30>
    printf(1, "NULL\n");
 74f:	83 ec 08             	sub    $0x8,%esp
 752:	68 50 0a 00 00       	push   $0xa50
 757:	6a 01                	push   $0x1
 759:	e8 d2 fd ff ff       	call   530 <printf>
  }
  printf(1, "NULL\n");
}
 75e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 761:	c9                   	leave  
 762:	c3                   	ret    
 763:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000770 <free>:

void
free(void *ap)
{
 770:	55                   	push   %ebp
  Header *bp, *p;
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 771:	a1 c0 0d 00 00       	mov    0xdc0,%eax
{
 776:	89 e5                	mov    %esp,%ebp
 778:	57                   	push   %edi
 779:	56                   	push   %esi
 77a:	53                   	push   %ebx
 77b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 77e:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 780:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 783:	39 c8                	cmp    %ecx,%eax
 785:	73 19                	jae    7a0 <free+0x30>
 787:	89 f6                	mov    %esi,%esi
 789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 790:	39 d1                	cmp    %edx,%ecx
 792:	72 14                	jb     7a8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 794:	39 d0                	cmp    %edx,%eax
 796:	73 10                	jae    7a8 <free+0x38>
{
 798:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 79a:	8b 10                	mov    (%eax),%edx
 79c:	39 c8                	cmp    %ecx,%eax
 79e:	72 f0                	jb     790 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a0:	39 d0                	cmp    %edx,%eax
 7a2:	72 f4                	jb     798 <free+0x28>
 7a4:	39 d1                	cmp    %edx,%ecx
 7a6:	73 f0                	jae    798 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ae:	39 fa                	cmp    %edi,%edx
 7b0:	74 1e                	je     7d0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7b2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7b5:	8b 50 04             	mov    0x4(%eax),%edx
 7b8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7bb:	39 f1                	cmp    %esi,%ecx
 7bd:	74 28                	je     7e7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7bf:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 7c1:	5b                   	pop    %ebx
  freep = p;
 7c2:	a3 c0 0d 00 00       	mov    %eax,0xdc0
}
 7c7:	5e                   	pop    %esi
 7c8:	5f                   	pop    %edi
 7c9:	5d                   	pop    %ebp
 7ca:	c3                   	ret    
 7cb:	90                   	nop
 7cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 7d0:	03 72 04             	add    0x4(%edx),%esi
 7d3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7d6:	8b 10                	mov    (%eax),%edx
 7d8:	8b 12                	mov    (%edx),%edx
 7da:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7dd:	8b 50 04             	mov    0x4(%eax),%edx
 7e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7e3:	39 f1                	cmp    %esi,%ecx
 7e5:	75 d8                	jne    7bf <free+0x4f>
    p->s.size += bp->s.size;
 7e7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 7ea:	a3 c0 0d 00 00       	mov    %eax,0xdc0
    p->s.size += bp->s.size;
 7ef:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7f2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7f5:	89 10                	mov    %edx,(%eax)
}
 7f7:	5b                   	pop    %ebx
 7f8:	5e                   	pop    %esi
 7f9:	5f                   	pop    %edi
 7fa:	5d                   	pop    %ebp
 7fb:	c3                   	ret    
 7fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000800 <morecore>:

static Header*
morecore(uint nu)
{
 800:	55                   	push   %ebp
 801:	89 e5                	mov    %esp,%ebp
 803:	53                   	push   %ebx
 804:	bb 00 10 00 00       	mov    $0x1000,%ebx
 809:	83 ec 10             	sub    $0x10,%esp
 80c:	3d 00 10 00 00       	cmp    $0x1000,%eax
 811:	0f 43 d8             	cmovae %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 814:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 81b:	50                   	push   %eax
 81c:	e8 3a fc ff ff       	call   45b <sbrk>
  if(p == (char*)-1)
 821:	83 c4 10             	add    $0x10,%esp
 824:	83 f8 ff             	cmp    $0xffffffff,%eax
 827:	74 1f                	je     848 <morecore+0x48>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 829:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 82c:	83 ec 0c             	sub    $0xc,%esp
 82f:	83 c0 08             	add    $0x8,%eax
 832:	50                   	push   %eax
 833:	e8 38 ff ff ff       	call   770 <free>
  return freep;
 838:	a1 c0 0d 00 00       	mov    0xdc0,%eax
}
 83d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  return freep;
 840:	83 c4 10             	add    $0x10,%esp
}
 843:	c9                   	leave  
 844:	c3                   	ret    
 845:	8d 76 00             	lea    0x0(%esi),%esi
 848:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return 0;
 84b:	31 c0                	xor    %eax,%eax
}
 84d:	c9                   	leave  
 84e:	c3                   	ret    
 84f:	90                   	nop

00000850 <malloc>:

void*
malloc(uint nbytes)
{
 850:	55                   	push   %ebp
  Header *p, *prevp;
  uint nunits;
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 851:	8b 0d c0 0d 00 00    	mov    0xdc0,%ecx
{
 857:	89 e5                	mov    %esp,%ebp
 859:	56                   	push   %esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 85a:	8b 45 08             	mov    0x8(%ebp),%eax
{
 85d:	53                   	push   %ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 85e:	8d 58 07             	lea    0x7(%eax),%ebx
 861:	c1 eb 03             	shr    $0x3,%ebx
 864:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 867:	85 c9                	test   %ecx,%ecx
 869:	74 65                	je     8d0 <malloc+0x80>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 86b:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 86d:	8b 50 04             	mov    0x4(%eax),%edx
 870:	39 d3                	cmp    %edx,%ebx
 872:	77 1d                	ja     891 <malloc+0x41>
 874:	eb 2e                	jmp    8a4 <malloc+0x54>
 876:	8d 76 00             	lea    0x0(%esi),%esi
 879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 880:	8b 30                	mov    (%eax),%esi
    if(p->s.size >= nunits){
 882:	8b 56 04             	mov    0x4(%esi),%edx
 885:	39 da                	cmp    %ebx,%edx
 887:	73 27                	jae    8b0 <malloc+0x60>
 889:	8b 0d c0 0d 00 00    	mov    0xdc0,%ecx
 88f:	89 f0                	mov    %esi,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 891:	39 c1                	cmp    %eax,%ecx
 893:	75 eb                	jne    880 <malloc+0x30>
      if((p = morecore(nunits)) == 0)
 895:	89 d8                	mov    %ebx,%eax
 897:	e8 64 ff ff ff       	call   800 <morecore>
 89c:	85 c0                	test   %eax,%eax
 89e:	75 e0                	jne    880 <malloc+0x30>
        return 0;
  }
}
 8a0:	5b                   	pop    %ebx
 8a1:	5e                   	pop    %esi
 8a2:	5d                   	pop    %ebp
 8a3:	c3                   	ret    
    if(p->s.size >= nunits){
 8a4:	89 c6                	mov    %eax,%esi
 8a6:	89 c8                	mov    %ecx,%eax
 8a8:	90                   	nop
 8a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 8b0:	39 d3                	cmp    %edx,%ebx
 8b2:	74 4c                	je     900 <malloc+0xb0>
        p->s.size -= nunits;
 8b4:	29 da                	sub    %ebx,%edx
 8b6:	89 56 04             	mov    %edx,0x4(%esi)
        p += p->s.size;
 8b9:	8d 34 d6             	lea    (%esi,%edx,8),%esi
        p->s.size = nunits;
 8bc:	89 5e 04             	mov    %ebx,0x4(%esi)
}
 8bf:	5b                   	pop    %ebx
      freep = prevp;
 8c0:	a3 c0 0d 00 00       	mov    %eax,0xdc0
      return (void*)(p + 1);
 8c5:	8d 46 08             	lea    0x8(%esi),%eax
}
 8c8:	5e                   	pop    %esi
 8c9:	5d                   	pop    %ebp
 8ca:	c3                   	ret    
 8cb:	90                   	nop
 8cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 8d0:	c7 05 c0 0d 00 00 c4 	movl   $0xdc4,0xdc0
 8d7:	0d 00 00 
    base.s.size = 0;
 8da:	b9 c4 0d 00 00       	mov    $0xdc4,%ecx
    base.s.ptr = freep = prevp = &base;
 8df:	c7 05 c4 0d 00 00 c4 	movl   $0xdc4,0xdc4
 8e6:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e9:	89 c8                	mov    %ecx,%eax
    base.s.size = 0;
 8eb:	c7 05 c8 0d 00 00 00 	movl   $0x0,0xdc8
 8f2:	00 00 00 
    if(p->s.size >= nunits){
 8f5:	eb 9a                	jmp    891 <malloc+0x41>
 8f7:	89 f6                	mov    %esi,%esi
 8f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        prevp->s.ptr = p->s.ptr;
 900:	8b 16                	mov    (%esi),%edx
 902:	89 10                	mov    %edx,(%eax)
 904:	eb b9                	jmp    8bf <malloc+0x6f>
 906:	8d 76 00             	lea    0x0(%esi),%esi
 909:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000910 <malloc_wf>:

// modify malloc to implement 'worst fit' strategy
void*
malloc_wf(uint nbytes)
{
 910:	55                   	push   %ebp
 911:	89 e5                	mov    %esp,%ebp
 913:	57                   	push   %edi
 914:	56                   	push   %esi
 915:	53                   	push   %ebx
 916:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp, *maxp, *maxprevp;
  uint nunits;
  uint max = 0;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 919:	8b 45 08             	mov    0x8(%ebp),%eax
 91c:	83 c0 07             	add    $0x7,%eax
 91f:	c1 e8 03             	shr    $0x3,%eax
 922:	83 c0 01             	add    $0x1,%eax
 925:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 928:	90                   	nop
 929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  if((prevp = freep) == 0){
 930:	8b 1d c0 0d 00 00    	mov    0xdc0,%ebx
 936:	85 db                	test   %ebx,%ebx
 938:	74 66                	je     9a0 <malloc_wf+0x90>
 93a:	8b 03                	mov    (%ebx),%eax
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }

  maxp = 0;
  maxprevp = 0;
 93c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  if((prevp = freep) == 0){
 943:	89 df                	mov    %ebx,%edi
  uint max = 0;
 945:	31 f6                	xor    %esi,%esi
  maxp = 0;
 947:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 94e:	8b 50 04             	mov    0x4(%eax),%edx
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 951:	eb 12                	jmp    965 <malloc_wf+0x55>
 953:	90                   	nop
 954:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->s.size >= nunits && p->s.size > max){
      max = p->s.size;
      maxp = p;
      maxprevp = prevp;
    }
    if(p == freep)
 958:	39 d8                	cmp    %ebx,%eax
 95a:	74 24                	je     980 <malloc_wf+0x70>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 95c:	8b 08                	mov    (%eax),%ecx
    if(p->s.size >= nunits && p->s.size > max){
 95e:	89 c7                	mov    %eax,%edi
 960:	8b 51 04             	mov    0x4(%ecx),%edx
 963:	89 c8                	mov    %ecx,%eax
 965:	39 d6                	cmp    %edx,%esi
 967:	73 ef                	jae    958 <malloc_wf+0x48>
 969:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
 96c:	77 ea                	ja     958 <malloc_wf+0x48>
    if(p == freep)
 96e:	39 d8                	cmp    %ebx,%eax
 970:	74 57                	je     9c9 <malloc_wf+0xb9>
 972:	89 7d dc             	mov    %edi,-0x24(%ebp)
 975:	89 d6                	mov    %edx,%esi
 977:	89 45 e0             	mov    %eax,-0x20(%ebp)
 97a:	eb e0                	jmp    95c <malloc_wf+0x4c>
 97c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      break;
  }

  if(maxp != 0){
 980:	8b 45 e0             	mov    -0x20(%ebp),%eax
 983:	85 c0                	test   %eax,%eax
 985:	75 39                	jne    9c0 <malloc_wf+0xb0>
      p->s.size = nunits;
    }
    freep = prevp;
    return (void*)(p + 1);
  } else {
    if((p = morecore(nunits)) == 0)
 987:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 98a:	e8 71 fe ff ff       	call   800 <morecore>
 98f:	85 c0                	test   %eax,%eax
 991:	75 9d                	jne    930 <malloc_wf+0x20>
      return 0;
    return malloc_wf(nbytes);
  }
 993:	83 c4 1c             	add    $0x1c,%esp
 996:	5b                   	pop    %ebx
 997:	5e                   	pop    %esi
 998:	5f                   	pop    %edi
 999:	5d                   	pop    %ebp
 99a:	c3                   	ret    
 99b:	90                   	nop
 99c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 9a0:	c7 05 c0 0d 00 00 c4 	movl   $0xdc4,0xdc0
 9a7:	0d 00 00 
 9aa:	c7 05 c4 0d 00 00 c4 	movl   $0xdc4,0xdc4
 9b1:	0d 00 00 
    base.s.size = 0;
 9b4:	c7 05 c8 0d 00 00 00 	movl   $0x0,0xdc8
 9bb:	00 00 00 
  if(maxp != 0){
 9be:	eb c7                	jmp    987 <malloc_wf+0x77>
 9c0:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 9c3:	8b 7d dc             	mov    -0x24(%ebp),%edi
 9c6:	8b 53 04             	mov    0x4(%ebx),%edx
    if(p->s.size == nunits){
 9c9:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
 9cc:	74 1f                	je     9ed <malloc_wf+0xdd>
      p->s.size -= nunits;
 9ce:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 9d1:	29 c2                	sub    %eax,%edx
 9d3:	89 53 04             	mov    %edx,0x4(%ebx)
      p = p + p->s.size;
 9d6:	8d 1c d3             	lea    (%ebx,%edx,8),%ebx
      p->s.size = nunits;
 9d9:	89 43 04             	mov    %eax,0x4(%ebx)
    freep = prevp;
 9dc:	89 3d c0 0d 00 00    	mov    %edi,0xdc0
 9e2:	83 c4 1c             	add    $0x1c,%esp
    return (void*)(p + 1);
 9e5:	8d 43 08             	lea    0x8(%ebx),%eax
 9e8:	5b                   	pop    %ebx
 9e9:	5e                   	pop    %esi
 9ea:	5f                   	pop    %edi
 9eb:	5d                   	pop    %ebp
 9ec:	c3                   	ret    
      prevp->s.ptr = p->s.ptr;
 9ed:	8b 03                	mov    (%ebx),%eax
 9ef:	89 07                	mov    %eax,(%edi)
 9f1:	eb e9                	jmp    9dc <malloc_wf+0xcc>
