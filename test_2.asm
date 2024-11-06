
_test_2:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"
#include "mmu.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
  int size_array3[5] = {500, 200, 300, 200, 400};
  int i;

  // Malloc ten times
  printf(1, "----------------malloc 10 times-----------------\n");
  for(i = 0; i < 10; i++){
   e:	31 ff                	xor    %edi,%edi
{
  10:	56                   	push   %esi
  11:	8d 75 c0             	lea    -0x40(%ebp),%esi
  14:	53                   	push   %ebx
  15:	8d 5d 98             	lea    -0x68(%ebp),%ebx
  18:	51                   	push   %ecx
  19:	81 ec 90 00 00 00    	sub    $0x90,%esp
  int size_array[10] = {600, 5, 100, 5, 1300, 5, 300, 5, 800, 5};
  1f:	c7 45 c4 05 00 00 00 	movl   $0x5,-0x3c(%ebp)
  printf(1, "----------------malloc 10 times-----------------\n");
  26:	68 34 0a 00 00       	push   $0xa34
  2b:	6a 01                	push   $0x1
  int size_array[10] = {600, 5, 100, 5, 1300, 5, 300, 5, 800, 5};
  2d:	c7 45 c8 64 00 00 00 	movl   $0x64,-0x38(%ebp)
  34:	c7 45 cc 05 00 00 00 	movl   $0x5,-0x34(%ebp)
  3b:	c7 45 d0 14 05 00 00 	movl   $0x514,-0x30(%ebp)
  42:	c7 45 d4 05 00 00 00 	movl   $0x5,-0x2c(%ebp)
  49:	c7 45 d8 2c 01 00 00 	movl   $0x12c,-0x28(%ebp)
  50:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
  57:	c7 45 e0 20 03 00 00 	movl   $0x320,-0x20(%ebp)
  5e:	c7 45 e4 05 00 00 00 	movl   $0x5,-0x1c(%ebp)
  int size_array2[5] = {200, 900, 300, 100, 700};
  65:	c7 85 74 ff ff ff 84 	movl   $0x384,-0x8c(%ebp)
  6c:	03 00 00 
  6f:	c7 85 78 ff ff ff 2c 	movl   $0x12c,-0x88(%ebp)
  76:	01 00 00 
  79:	c7 85 7c ff ff ff 64 	movl   $0x64,-0x84(%ebp)
  80:	00 00 00 
  83:	c7 45 80 bc 02 00 00 	movl   $0x2bc,-0x80(%ebp)
  int size_array3[5] = {500, 200, 300, 200, 400};
  8a:	c7 45 88 c8 00 00 00 	movl   $0xc8,-0x78(%ebp)
  91:	c7 45 8c 2c 01 00 00 	movl   $0x12c,-0x74(%ebp)
  98:	c7 45 90 c8 00 00 00 	movl   $0xc8,-0x70(%ebp)
  9f:	c7 45 94 90 01 00 00 	movl   $0x190,-0x6c(%ebp)
  printf(1, "----------------malloc 10 times-----------------\n");
  a6:	e8 c5 04 00 00       	call   570 <printf>
  ab:	83 c4 10             	add    $0x10,%esp
  ae:	b8 58 02 00 00       	mov    $0x258,%eax
  b3:	eb 06                	jmp    bb <main+0xbb>
  b5:	8d 76 00             	lea    0x0(%esi),%esi
  b8:	8b 04 be             	mov    (%esi,%edi,4),%eax
    ptr_array[i] = (int*)malloc(size_array[i] * 8 - 8);
  bb:	83 ec 0c             	sub    $0xc,%esp
  be:	8d 04 c5 f8 ff ff ff 	lea    -0x8(,%eax,8),%eax
  c5:	50                   	push   %eax
  c6:	e8 c5 07 00 00       	call   890 <malloc>
  for(i = 0; i < 10; i++){
  cb:	83 c4 10             	add    $0x10,%esp
    ptr_array[i] = (int*)malloc(size_array[i] * 8 - 8);
  ce:	89 04 bb             	mov    %eax,(%ebx,%edi,4)
  for(i = 0; i < 10; i++){
  d1:	83 c7 01             	add    $0x1,%edi
    //just to avoid warning
    ptr_array[i][0] = 0;
  d4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(i = 0; i < 10; i++){
  da:	83 ff 0a             	cmp    $0xa,%edi
  dd:	75 d9                	jne    b8 <main+0xb8>
  }
  print_free_list();
  df:	e8 5c 06 00 00       	call   740 <print_free_list>

  // Free five times
  printf(1, "-----------------free 5 times-------------------\n");
  e4:	83 ec 08             	sub    $0x8,%esp
  e7:	89 df                	mov    %ebx,%edi
  e9:	68 68 0a 00 00       	push   $0xa68
  ee:	6a 01                	push   $0x1
  f0:	e8 7b 04 00 00       	call   570 <printf>
  for(i = 0; i < 5; i++){
  f5:	83 c4 10             	add    $0x10,%esp
    free(ptr_array[2 * i]);
  f8:	83 ec 0c             	sub    $0xc,%esp
  fb:	ff 37                	pushl  (%edi)
  fd:	83 c7 08             	add    $0x8,%edi
 100:	e8 ab 06 00 00       	call   7b0 <free>
  for(i = 0; i < 5; i++){
 105:	83 c4 10             	add    $0x10,%esp
 108:	39 fe                	cmp    %edi,%esi
 10a:	75 ec                	jne    f8 <main+0xf8>
  }
  print_free_list();
 10c:	e8 2f 06 00 00       	call   740 <print_free_list>

  // Show results when using first fit strategy (default)
  printf(1, "------------------first fit---------------------\n");
 111:	83 ec 08             	sub    $0x8,%esp
 114:	8d bd 70 ff ff ff    	lea    -0x90(%ebp),%edi
 11a:	be c8 00 00 00       	mov    $0xc8,%esi
 11f:	68 9c 0a 00 00       	push   $0xa9c
 124:	6a 01                	push   $0x1
 126:	e8 45 04 00 00       	call   570 <printf>
  for(i = 0; i < 5; i++){
 12b:	83 c4 10             	add    $0x10,%esp
    printf(1, "malloc(%d)\n", size_array2[i])    ;
 12e:	83 ec 04             	sub    $0x4,%esp
 131:	83 c7 04             	add    $0x4,%edi
 134:	56                   	push   %esi
 135:	68 04 0b 00 00       	push   $0xb04
 13a:	6a 01                	push   $0x1
 13c:	e8 2f 04 00 00       	call   570 <printf>
    malloc(size_array2[i] * 8 - 8);
 141:	8d 04 f5 f8 ff ff ff 	lea    -0x8(,%esi,8),%eax
 148:	89 04 24             	mov    %eax,(%esp)
 14b:	e8 40 07 00 00       	call   890 <malloc>
  for(i = 0; i < 5; i++){
 150:	8d 45 84             	lea    -0x7c(%ebp),%eax
 153:	83 c4 10             	add    $0x10,%esp
 156:	39 f8                	cmp    %edi,%eax
 158:	74 06                	je     160 <main+0x160>
 15a:	8b 37                	mov    (%edi),%esi
 15c:	eb d0                	jmp    12e <main+0x12e>
 15e:	66 90                	xchg   %ax,%ax
  }
  print_free_list();
 160:	e8 db 05 00 00       	call   740 <print_free_list>

  //init_freep();
  printf(1, "------------------worst fit---------------------\n");
 165:	83 ec 08             	sub    $0x8,%esp
 168:	8d 75 84             	lea    -0x7c(%ebp),%esi
 16b:	bf f4 01 00 00       	mov    $0x1f4,%edi
 170:	68 d0 0a 00 00       	push   $0xad0
 175:	6a 01                	push   $0x1
 177:	e8 f4 03 00 00       	call   570 <printf>
  for(i = 0; i < 5; i++){
 17c:	83 c4 10             	add    $0x10,%esp
    printf(1, "malloc_wf(%d)\n", size_array3[i])    ;
 17f:	83 ec 04             	sub    $0x4,%esp
 182:	83 c6 04             	add    $0x4,%esi
 185:	57                   	push   %edi
 186:	68 10 0b 00 00       	push   $0xb10
 18b:	6a 01                	push   $0x1
 18d:	e8 de 03 00 00       	call   570 <printf>
    malloc_wf(size_array3[i] * 8 - 8);
 192:	8d 04 fd f8 ff ff ff 	lea    -0x8(,%edi,8),%eax
 199:	89 04 24             	mov    %eax,(%esp)
 19c:	e8 af 07 00 00       	call   950 <malloc_wf>
  for(i = 0; i < 5; i++){
 1a1:	83 c4 10             	add    $0x10,%esp
 1a4:	39 f3                	cmp    %esi,%ebx
 1a6:	74 08                	je     1b0 <main+0x1b0>
 1a8:	8b 3e                	mov    (%esi),%edi
 1aa:	eb d3                	jmp    17f <main+0x17f>
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }
  print_free_list();
 1b0:	e8 8b 05 00 00       	call   740 <print_free_list>

  exit();
 1b5:	e8 59 02 00 00       	call   413 <exit>
 1ba:	66 90                	xchg   %ax,%ax
 1bc:	66 90                	xchg   %ax,%ax
 1be:	66 90                	xchg   %ax,%ax

000001c0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1c0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1c1:	31 c0                	xor    %eax,%eax
{
 1c3:	89 e5                	mov    %esp,%ebp
 1c5:	53                   	push   %ebx
 1c6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 1d0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1d4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1d7:	83 c0 01             	add    $0x1,%eax
 1da:	84 d2                	test   %dl,%dl
 1dc:	75 f2                	jne    1d0 <strcpy+0x10>
    ;
  return os;
}
 1de:	89 c8                	mov    %ecx,%eax
 1e0:	5b                   	pop    %ebx
 1e1:	5d                   	pop    %ebp
 1e2:	c3                   	ret    
 1e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	53                   	push   %ebx
 1f4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1f7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1fa:	0f b6 01             	movzbl (%ecx),%eax
 1fd:	0f b6 1a             	movzbl (%edx),%ebx
 200:	84 c0                	test   %al,%al
 202:	75 1d                	jne    221 <strcmp+0x31>
 204:	eb 2a                	jmp    230 <strcmp+0x40>
 206:	8d 76 00             	lea    0x0(%esi),%esi
 209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 210:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 214:	83 c1 01             	add    $0x1,%ecx
 217:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 21a:	0f b6 1a             	movzbl (%edx),%ebx
 21d:	84 c0                	test   %al,%al
 21f:	74 0f                	je     230 <strcmp+0x40>
 221:	38 d8                	cmp    %bl,%al
 223:	74 eb                	je     210 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 225:	29 d8                	sub    %ebx,%eax
}
 227:	5b                   	pop    %ebx
 228:	5d                   	pop    %ebp
 229:	c3                   	ret    
 22a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 230:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 232:	29 d8                	sub    %ebx,%eax
}
 234:	5b                   	pop    %ebx
 235:	5d                   	pop    %ebp
 236:	c3                   	ret    
 237:	89 f6                	mov    %esi,%esi
 239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000240 <strlen>:

uint
strlen(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 246:	80 3a 00             	cmpb   $0x0,(%edx)
 249:	74 15                	je     260 <strlen+0x20>
 24b:	31 c0                	xor    %eax,%eax
 24d:	8d 76 00             	lea    0x0(%esi),%esi
 250:	83 c0 01             	add    $0x1,%eax
 253:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 257:	89 c1                	mov    %eax,%ecx
 259:	75 f5                	jne    250 <strlen+0x10>
    ;
  return n;
}
 25b:	89 c8                	mov    %ecx,%eax
 25d:	5d                   	pop    %ebp
 25e:	c3                   	ret    
 25f:	90                   	nop
  for(n = 0; s[n]; n++)
 260:	31 c9                	xor    %ecx,%ecx
}
 262:	5d                   	pop    %ebp
 263:	89 c8                	mov    %ecx,%eax
 265:	c3                   	ret    
 266:	8d 76 00             	lea    0x0(%esi),%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000270 <memset>:

void*
memset(void *dst, int c, uint n)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 277:	8b 4d 10             	mov    0x10(%ebp),%ecx
 27a:	8b 45 0c             	mov    0xc(%ebp),%eax
 27d:	89 d7                	mov    %edx,%edi
 27f:	fc                   	cld    
 280:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 282:	89 d0                	mov    %edx,%eax
 284:	5f                   	pop    %edi
 285:	5d                   	pop    %ebp
 286:	c3                   	ret    
 287:	89 f6                	mov    %esi,%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000290 <strchr>:

char*
strchr(const char *s, char c)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	8b 45 08             	mov    0x8(%ebp),%eax
 296:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 29a:	0f b6 10             	movzbl (%eax),%edx
 29d:	84 d2                	test   %dl,%dl
 29f:	75 12                	jne    2b3 <strchr+0x23>
 2a1:	eb 1d                	jmp    2c0 <strchr+0x30>
 2a3:	90                   	nop
 2a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2a8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 2ac:	83 c0 01             	add    $0x1,%eax
 2af:	84 d2                	test   %dl,%dl
 2b1:	74 0d                	je     2c0 <strchr+0x30>
    if(*s == c)
 2b3:	38 d1                	cmp    %dl,%cl
 2b5:	75 f1                	jne    2a8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 2b7:	5d                   	pop    %ebp
 2b8:	c3                   	ret    
 2b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2c0:	31 c0                	xor    %eax,%eax
}
 2c2:	5d                   	pop    %ebp
 2c3:	c3                   	ret    
 2c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000002d0 <gets>:

char*
gets(char *buf, int max)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	57                   	push   %edi
 2d4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2d5:	31 f6                	xor    %esi,%esi
{
 2d7:	53                   	push   %ebx
 2d8:	89 f3                	mov    %esi,%ebx
 2da:	83 ec 1c             	sub    $0x1c,%esp
 2dd:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 2e0:	eb 2f                	jmp    311 <gets+0x41>
 2e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 2e8:	83 ec 04             	sub    $0x4,%esp
 2eb:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2ee:	6a 01                	push   $0x1
 2f0:	50                   	push   %eax
 2f1:	6a 00                	push   $0x0
 2f3:	e8 33 01 00 00       	call   42b <read>
    if(cc < 1)
 2f8:	83 c4 10             	add    $0x10,%esp
 2fb:	85 c0                	test   %eax,%eax
 2fd:	7e 1c                	jle    31b <gets+0x4b>
      break;
    buf[i++] = c;
 2ff:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 303:	83 c7 01             	add    $0x1,%edi
 306:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 309:	3c 0a                	cmp    $0xa,%al
 30b:	74 23                	je     330 <gets+0x60>
 30d:	3c 0d                	cmp    $0xd,%al
 30f:	74 1f                	je     330 <gets+0x60>
  for(i=0; i+1 < max; ){
 311:	83 c3 01             	add    $0x1,%ebx
 314:	89 fe                	mov    %edi,%esi
 316:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 319:	7c cd                	jl     2e8 <gets+0x18>
 31b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 31d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 320:	c6 03 00             	movb   $0x0,(%ebx)
}
 323:	8d 65 f4             	lea    -0xc(%ebp),%esp
 326:	5b                   	pop    %ebx
 327:	5e                   	pop    %esi
 328:	5f                   	pop    %edi
 329:	5d                   	pop    %ebp
 32a:	c3                   	ret    
 32b:	90                   	nop
 32c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 330:	8b 75 08             	mov    0x8(%ebp),%esi
 333:	8b 45 08             	mov    0x8(%ebp),%eax
 336:	01 de                	add    %ebx,%esi
 338:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 33a:	c6 03 00             	movb   $0x0,(%ebx)
}
 33d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 340:	5b                   	pop    %ebx
 341:	5e                   	pop    %esi
 342:	5f                   	pop    %edi
 343:	5d                   	pop    %ebp
 344:	c3                   	ret    
 345:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 349:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000350 <stat>:

int
stat(const char *n, struct stat *st)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	56                   	push   %esi
 354:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 355:	83 ec 08             	sub    $0x8,%esp
 358:	6a 00                	push   $0x0
 35a:	ff 75 08             	pushl  0x8(%ebp)
 35d:	e8 f1 00 00 00       	call   453 <open>
  if(fd < 0)
 362:	83 c4 10             	add    $0x10,%esp
 365:	85 c0                	test   %eax,%eax
 367:	78 27                	js     390 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 369:	83 ec 08             	sub    $0x8,%esp
 36c:	ff 75 0c             	pushl  0xc(%ebp)
 36f:	89 c3                	mov    %eax,%ebx
 371:	50                   	push   %eax
 372:	e8 f4 00 00 00       	call   46b <fstat>
  close(fd);
 377:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 37a:	89 c6                	mov    %eax,%esi
  close(fd);
 37c:	e8 ba 00 00 00       	call   43b <close>
  return r;
 381:	83 c4 10             	add    $0x10,%esp
}
 384:	8d 65 f8             	lea    -0x8(%ebp),%esp
 387:	89 f0                	mov    %esi,%eax
 389:	5b                   	pop    %ebx
 38a:	5e                   	pop    %esi
 38b:	5d                   	pop    %ebp
 38c:	c3                   	ret    
 38d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 390:	be ff ff ff ff       	mov    $0xffffffff,%esi
 395:	eb ed                	jmp    384 <stat+0x34>
 397:	89 f6                	mov    %esi,%esi
 399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003a0 <atoi>:

int
atoi(const char *s)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	53                   	push   %ebx
 3a4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3a7:	0f be 02             	movsbl (%edx),%eax
 3aa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 3ad:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 3b0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 3b5:	77 1e                	ja     3d5 <atoi+0x35>
 3b7:	89 f6                	mov    %esi,%esi
 3b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 3c0:	83 c2 01             	add    $0x1,%edx
 3c3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3c6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3ca:	0f be 02             	movsbl (%edx),%eax
 3cd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3d0:	80 fb 09             	cmp    $0x9,%bl
 3d3:	76 eb                	jbe    3c0 <atoi+0x20>
  return n;
}
 3d5:	89 c8                	mov    %ecx,%eax
 3d7:	5b                   	pop    %ebx
 3d8:	5d                   	pop    %ebp
 3d9:	c3                   	ret    
 3da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	8b 45 10             	mov    0x10(%ebp),%eax
 3e7:	8b 55 08             	mov    0x8(%ebp),%edx
 3ea:	56                   	push   %esi
 3eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3ee:	85 c0                	test   %eax,%eax
 3f0:	7e 13                	jle    405 <memmove+0x25>
 3f2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3f4:	89 d7                	mov    %edx,%edi
 3f6:	8d 76 00             	lea    0x0(%esi),%esi
 3f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    *dst++ = *src++;
 400:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 401:	39 f8                	cmp    %edi,%eax
 403:	75 fb                	jne    400 <memmove+0x20>
  return vdst;
}
 405:	5e                   	pop    %esi
 406:	89 d0                	mov    %edx,%eax
 408:	5f                   	pop    %edi
 409:	5d                   	pop    %ebp
 40a:	c3                   	ret    

0000040b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 40b:	b8 01 00 00 00       	mov    $0x1,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <exit>:
SYSCALL(exit)
 413:	b8 02 00 00 00       	mov    $0x2,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <wait>:
SYSCALL(wait)
 41b:	b8 03 00 00 00       	mov    $0x3,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <pipe>:
SYSCALL(pipe)
 423:	b8 04 00 00 00       	mov    $0x4,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <read>:
SYSCALL(read)
 42b:	b8 05 00 00 00       	mov    $0x5,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <write>:
SYSCALL(write)
 433:	b8 10 00 00 00       	mov    $0x10,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <close>:
SYSCALL(close)
 43b:	b8 15 00 00 00       	mov    $0x15,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <kill>:
SYSCALL(kill)
 443:	b8 06 00 00 00       	mov    $0x6,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <exec>:
SYSCALL(exec)
 44b:	b8 07 00 00 00       	mov    $0x7,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <open>:
SYSCALL(open)
 453:	b8 0f 00 00 00       	mov    $0xf,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <mknod>:
SYSCALL(mknod)
 45b:	b8 11 00 00 00       	mov    $0x11,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <unlink>:
SYSCALL(unlink)
 463:	b8 12 00 00 00       	mov    $0x12,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <fstat>:
SYSCALL(fstat)
 46b:	b8 08 00 00 00       	mov    $0x8,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <link>:
SYSCALL(link)
 473:	b8 13 00 00 00       	mov    $0x13,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <mkdir>:
SYSCALL(mkdir)
 47b:	b8 14 00 00 00       	mov    $0x14,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <chdir>:
SYSCALL(chdir)
 483:	b8 09 00 00 00       	mov    $0x9,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <dup>:
SYSCALL(dup)
 48b:	b8 0a 00 00 00       	mov    $0xa,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <getpid>:
SYSCALL(getpid)
 493:	b8 0b 00 00 00       	mov    $0xb,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <sbrk>:
SYSCALL(sbrk)
 49b:	b8 0c 00 00 00       	mov    $0xc,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <sleep>:
SYSCALL(sleep)
 4a3:	b8 0d 00 00 00       	mov    $0xd,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <uptime>:
SYSCALL(uptime)
 4ab:	b8 0e 00 00 00       	mov    $0xe,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <walkpt>:
SYSCALL(walkpt)
 4b3:	b8 16 00 00 00       	mov    $0x16,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    
 4bb:	66 90                	xchg   %ax,%ax
 4bd:	66 90                	xchg   %ax,%ax
 4bf:	90                   	nop

000004c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	57                   	push   %edi
 4c4:	56                   	push   %esi
 4c5:	53                   	push   %ebx
 4c6:	83 ec 3c             	sub    $0x3c,%esp
 4c9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4cc:	89 d1                	mov    %edx,%ecx
{
 4ce:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 4d1:	85 d2                	test   %edx,%edx
 4d3:	0f 89 7f 00 00 00    	jns    558 <printint+0x98>
 4d9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4dd:	74 79                	je     558 <printint+0x98>
    neg = 1;
 4df:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 4e6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 4e8:	31 db                	xor    %ebx,%ebx
 4ea:	8d 75 d7             	lea    -0x29(%ebp),%esi
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 4f0:	89 c8                	mov    %ecx,%eax
 4f2:	31 d2                	xor    %edx,%edx
 4f4:	89 cf                	mov    %ecx,%edi
 4f6:	f7 75 c4             	divl   -0x3c(%ebp)
 4f9:	0f b6 92 28 0b 00 00 	movzbl 0xb28(%edx),%edx
 500:	89 45 c0             	mov    %eax,-0x40(%ebp)
 503:	89 d8                	mov    %ebx,%eax
 505:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 508:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 50b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 50e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 511:	76 dd                	jbe    4f0 <printint+0x30>
  if(neg)
 513:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 516:	85 c9                	test   %ecx,%ecx
 518:	74 0c                	je     526 <printint+0x66>
    buf[i++] = '-';
 51a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 51f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 521:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 526:	8b 7d b8             	mov    -0x48(%ebp),%edi
 529:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 52d:	eb 07                	jmp    536 <printint+0x76>
 52f:	90                   	nop
 530:	0f b6 13             	movzbl (%ebx),%edx
 533:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 536:	83 ec 04             	sub    $0x4,%esp
 539:	88 55 d7             	mov    %dl,-0x29(%ebp)
 53c:	6a 01                	push   $0x1
 53e:	56                   	push   %esi
 53f:	57                   	push   %edi
 540:	e8 ee fe ff ff       	call   433 <write>
  while(--i >= 0)
 545:	83 c4 10             	add    $0x10,%esp
 548:	39 de                	cmp    %ebx,%esi
 54a:	75 e4                	jne    530 <printint+0x70>
    putc(fd, buf[i]);
}
 54c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 54f:	5b                   	pop    %ebx
 550:	5e                   	pop    %esi
 551:	5f                   	pop    %edi
 552:	5d                   	pop    %ebp
 553:	c3                   	ret    
 554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 558:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 55f:	eb 87                	jmp    4e8 <printint+0x28>
 561:	eb 0d                	jmp    570 <printf>
 563:	90                   	nop
 564:	90                   	nop
 565:	90                   	nop
 566:	90                   	nop
 567:	90                   	nop
 568:	90                   	nop
 569:	90                   	nop
 56a:	90                   	nop
 56b:	90                   	nop
 56c:	90                   	nop
 56d:	90                   	nop
 56e:	90                   	nop
 56f:	90                   	nop

00000570 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	57                   	push   %edi
 574:	56                   	push   %esi
 575:	53                   	push   %ebx
 576:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 579:	8b 75 0c             	mov    0xc(%ebp),%esi
 57c:	0f b6 1e             	movzbl (%esi),%ebx
 57f:	84 db                	test   %bl,%bl
 581:	0f 84 b8 00 00 00    	je     63f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 587:	8d 45 10             	lea    0x10(%ebp),%eax
 58a:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 58d:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 590:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 592:	89 45 d0             	mov    %eax,-0x30(%ebp)
 595:	eb 37                	jmp    5ce <printf+0x5e>
 597:	89 f6                	mov    %esi,%esi
 599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 5a0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5a3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 5a8:	83 f8 25             	cmp    $0x25,%eax
 5ab:	74 17                	je     5c4 <printf+0x54>
  write(fd, &c, 1);
 5ad:	83 ec 04             	sub    $0x4,%esp
 5b0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5b3:	6a 01                	push   $0x1
 5b5:	57                   	push   %edi
 5b6:	ff 75 08             	pushl  0x8(%ebp)
 5b9:	e8 75 fe ff ff       	call   433 <write>
 5be:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 5c1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5c4:	0f b6 1e             	movzbl (%esi),%ebx
 5c7:	83 c6 01             	add    $0x1,%esi
 5ca:	84 db                	test   %bl,%bl
 5cc:	74 71                	je     63f <printf+0xcf>
    c = fmt[i] & 0xff;
 5ce:	0f be cb             	movsbl %bl,%ecx
 5d1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5d4:	85 d2                	test   %edx,%edx
 5d6:	74 c8                	je     5a0 <printf+0x30>
      }
    } else if(state == '%'){
 5d8:	83 fa 25             	cmp    $0x25,%edx
 5db:	75 e7                	jne    5c4 <printf+0x54>
      if(c == 'd'){
 5dd:	83 f8 64             	cmp    $0x64,%eax
 5e0:	0f 84 9a 00 00 00    	je     680 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5e6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 5ec:	83 f9 70             	cmp    $0x70,%ecx
 5ef:	74 5f                	je     650 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5f1:	83 f8 73             	cmp    $0x73,%eax
 5f4:	0f 84 d6 00 00 00    	je     6d0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5fa:	83 f8 63             	cmp    $0x63,%eax
 5fd:	0f 84 8d 00 00 00    	je     690 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 603:	83 f8 25             	cmp    $0x25,%eax
 606:	0f 84 b4 00 00 00    	je     6c0 <printf+0x150>
  write(fd, &c, 1);
 60c:	83 ec 04             	sub    $0x4,%esp
 60f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 613:	6a 01                	push   $0x1
 615:	57                   	push   %edi
 616:	ff 75 08             	pushl  0x8(%ebp)
 619:	e8 15 fe ff ff       	call   433 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 61e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 621:	83 c4 0c             	add    $0xc,%esp
 624:	6a 01                	push   $0x1
 626:	83 c6 01             	add    $0x1,%esi
 629:	57                   	push   %edi
 62a:	ff 75 08             	pushl  0x8(%ebp)
 62d:	e8 01 fe ff ff       	call   433 <write>
  for(i = 0; fmt[i]; i++){
 632:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 636:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 639:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 63b:	84 db                	test   %bl,%bl
 63d:	75 8f                	jne    5ce <printf+0x5e>
    }
  }
}
 63f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 642:	5b                   	pop    %ebx
 643:	5e                   	pop    %esi
 644:	5f                   	pop    %edi
 645:	5d                   	pop    %ebp
 646:	c3                   	ret    
 647:	89 f6                	mov    %esi,%esi
 649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        printint(fd, *ap, 16, 0);
 650:	83 ec 0c             	sub    $0xc,%esp
 653:	b9 10 00 00 00       	mov    $0x10,%ecx
 658:	6a 00                	push   $0x0
 65a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 65d:	8b 45 08             	mov    0x8(%ebp),%eax
 660:	8b 13                	mov    (%ebx),%edx
 662:	e8 59 fe ff ff       	call   4c0 <printint>
        ap++;
 667:	89 d8                	mov    %ebx,%eax
 669:	83 c4 10             	add    $0x10,%esp
      state = 0;
 66c:	31 d2                	xor    %edx,%edx
        ap++;
 66e:	83 c0 04             	add    $0x4,%eax
 671:	89 45 d0             	mov    %eax,-0x30(%ebp)
 674:	e9 4b ff ff ff       	jmp    5c4 <printf+0x54>
 679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 680:	83 ec 0c             	sub    $0xc,%esp
 683:	b9 0a 00 00 00       	mov    $0xa,%ecx
 688:	6a 01                	push   $0x1
 68a:	eb ce                	jmp    65a <printf+0xea>
 68c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 690:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 693:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 696:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 698:	6a 01                	push   $0x1
        ap++;
 69a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 69d:	57                   	push   %edi
 69e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 6a1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6a4:	e8 8a fd ff ff       	call   433 <write>
        ap++;
 6a9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6ac:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6af:	31 d2                	xor    %edx,%edx
 6b1:	e9 0e ff ff ff       	jmp    5c4 <printf+0x54>
 6b6:	8d 76 00             	lea    0x0(%esi),%esi
 6b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        putc(fd, c);
 6c0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 6c3:	83 ec 04             	sub    $0x4,%esp
 6c6:	e9 59 ff ff ff       	jmp    624 <printf+0xb4>
 6cb:	90                   	nop
 6cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 6d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6d3:	8b 18                	mov    (%eax),%ebx
        ap++;
 6d5:	83 c0 04             	add    $0x4,%eax
 6d8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6db:	85 db                	test   %ebx,%ebx
 6dd:	74 17                	je     6f6 <printf+0x186>
        while(*s != 0){
 6df:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 6e2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 6e4:	84 c0                	test   %al,%al
 6e6:	0f 84 d8 fe ff ff    	je     5c4 <printf+0x54>
 6ec:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 6ef:	89 de                	mov    %ebx,%esi
 6f1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6f4:	eb 1a                	jmp    710 <printf+0x1a0>
          s = "(null)";
 6f6:	bb 1f 0b 00 00       	mov    $0xb1f,%ebx
        while(*s != 0){
 6fb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 6fe:	b8 28 00 00 00       	mov    $0x28,%eax
 703:	89 de                	mov    %ebx,%esi
 705:	8b 5d 08             	mov    0x8(%ebp),%ebx
 708:	90                   	nop
 709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 710:	83 ec 04             	sub    $0x4,%esp
          s++;
 713:	83 c6 01             	add    $0x1,%esi
 716:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 719:	6a 01                	push   $0x1
 71b:	57                   	push   %edi
 71c:	53                   	push   %ebx
 71d:	e8 11 fd ff ff       	call   433 <write>
        while(*s != 0){
 722:	0f b6 06             	movzbl (%esi),%eax
 725:	83 c4 10             	add    $0x10,%esp
 728:	84 c0                	test   %al,%al
 72a:	75 e4                	jne    710 <printf+0x1a0>
 72c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 72f:	31 d2                	xor    %edx,%edx
 731:	e9 8e fe ff ff       	jmp    5c4 <printf+0x54>
 736:	66 90                	xchg   %ax,%ax
 738:	66 90                	xchg   %ax,%ax
 73a:	66 90                	xchg   %ax,%ax
 73c:	66 90                	xchg   %ax,%ax
 73e:	66 90                	xchg   %ax,%ax

00000740 <print_free_list>:
static Header base;
static Header *freep;

// print free list status
void
print_free_list(){
 740:	55                   	push   %ebp
 741:	89 e5                	mov    %esp,%ebp
 743:	53                   	push   %ebx
 744:	83 ec 0c             	sub    $0xc,%esp
  Header* p;
  printf(1, "Header -> ");
 747:	68 39 0b 00 00       	push   $0xb39
 74c:	6a 01                	push   $0x1
 74e:	e8 1d fe ff ff       	call   570 <printf>
  if(freep == 0){ 
 753:	a1 80 0e 00 00       	mov    0xe80,%eax
 758:	83 c4 10             	add    $0x10,%esp
 75b:	85 c0                	test   %eax,%eax
 75d:	74 30                	je     78f <print_free_list+0x4f>
    printf(1, "NULL\n");
    return;
  }
  for(p = base.s.ptr; p != &base; p = p->s.ptr){
 75f:	8b 1d 84 0e 00 00    	mov    0xe84,%ebx
 765:	81 fb 84 0e 00 00    	cmp    $0xe84,%ebx
 76b:	74 22                	je     78f <print_free_list+0x4f>
 76d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%d -> ", p->s.size);
 770:	83 ec 04             	sub    $0x4,%esp
 773:	ff 73 04             	pushl  0x4(%ebx)
 776:	68 4a 0b 00 00       	push   $0xb4a
 77b:	6a 01                	push   $0x1
 77d:	e8 ee fd ff ff       	call   570 <printf>
  for(p = base.s.ptr; p != &base; p = p->s.ptr){
 782:	8b 1b                	mov    (%ebx),%ebx
 784:	83 c4 10             	add    $0x10,%esp
 787:	81 fb 84 0e 00 00    	cmp    $0xe84,%ebx
 78d:	75 e1                	jne    770 <print_free_list+0x30>
    printf(1, "NULL\n");
 78f:	83 ec 08             	sub    $0x8,%esp
 792:	68 44 0b 00 00       	push   $0xb44
 797:	6a 01                	push   $0x1
 799:	e8 d2 fd ff ff       	call   570 <printf>
  }
  printf(1, "NULL\n");
}
 79e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7a1:	c9                   	leave  
 7a2:	c3                   	ret    
 7a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 7a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000007b0 <free>:

void
free(void *ap)
{
 7b0:	55                   	push   %ebp
  Header *bp, *p;
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7b1:	a1 80 0e 00 00       	mov    0xe80,%eax
{
 7b6:	89 e5                	mov    %esp,%ebp
 7b8:	57                   	push   %edi
 7b9:	56                   	push   %esi
 7ba:	53                   	push   %ebx
 7bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7be:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 7c0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c3:	39 c8                	cmp    %ecx,%eax
 7c5:	73 19                	jae    7e0 <free+0x30>
 7c7:	89 f6                	mov    %esi,%esi
 7c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 7d0:	39 d1                	cmp    %edx,%ecx
 7d2:	72 14                	jb     7e8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7d4:	39 d0                	cmp    %edx,%eax
 7d6:	73 10                	jae    7e8 <free+0x38>
{
 7d8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7da:	8b 10                	mov    (%eax),%edx
 7dc:	39 c8                	cmp    %ecx,%eax
 7de:	72 f0                	jb     7d0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7e0:	39 d0                	cmp    %edx,%eax
 7e2:	72 f4                	jb     7d8 <free+0x28>
 7e4:	39 d1                	cmp    %edx,%ecx
 7e6:	73 f0                	jae    7d8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ee:	39 fa                	cmp    %edi,%edx
 7f0:	74 1e                	je     810 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7f2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7f5:	8b 50 04             	mov    0x4(%eax),%edx
 7f8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7fb:	39 f1                	cmp    %esi,%ecx
 7fd:	74 28                	je     827 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7ff:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 801:	5b                   	pop    %ebx
  freep = p;
 802:	a3 80 0e 00 00       	mov    %eax,0xe80
}
 807:	5e                   	pop    %esi
 808:	5f                   	pop    %edi
 809:	5d                   	pop    %ebp
 80a:	c3                   	ret    
 80b:	90                   	nop
 80c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 810:	03 72 04             	add    0x4(%edx),%esi
 813:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 816:	8b 10                	mov    (%eax),%edx
 818:	8b 12                	mov    (%edx),%edx
 81a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 81d:	8b 50 04             	mov    0x4(%eax),%edx
 820:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 823:	39 f1                	cmp    %esi,%ecx
 825:	75 d8                	jne    7ff <free+0x4f>
    p->s.size += bp->s.size;
 827:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 82a:	a3 80 0e 00 00       	mov    %eax,0xe80
    p->s.size += bp->s.size;
 82f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 832:	8b 53 f8             	mov    -0x8(%ebx),%edx
 835:	89 10                	mov    %edx,(%eax)
}
 837:	5b                   	pop    %ebx
 838:	5e                   	pop    %esi
 839:	5f                   	pop    %edi
 83a:	5d                   	pop    %ebp
 83b:	c3                   	ret    
 83c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000840 <morecore>:

static Header*
morecore(uint nu)
{
 840:	55                   	push   %ebp
 841:	89 e5                	mov    %esp,%ebp
 843:	53                   	push   %ebx
 844:	bb 00 10 00 00       	mov    $0x1000,%ebx
 849:	83 ec 10             	sub    $0x10,%esp
 84c:	3d 00 10 00 00       	cmp    $0x1000,%eax
 851:	0f 43 d8             	cmovae %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 854:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 85b:	50                   	push   %eax
 85c:	e8 3a fc ff ff       	call   49b <sbrk>
  if(p == (char*)-1)
 861:	83 c4 10             	add    $0x10,%esp
 864:	83 f8 ff             	cmp    $0xffffffff,%eax
 867:	74 1f                	je     888 <morecore+0x48>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 869:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 86c:	83 ec 0c             	sub    $0xc,%esp
 86f:	83 c0 08             	add    $0x8,%eax
 872:	50                   	push   %eax
 873:	e8 38 ff ff ff       	call   7b0 <free>
  return freep;
 878:	a1 80 0e 00 00       	mov    0xe80,%eax
}
 87d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  return freep;
 880:	83 c4 10             	add    $0x10,%esp
}
 883:	c9                   	leave  
 884:	c3                   	ret    
 885:	8d 76 00             	lea    0x0(%esi),%esi
 888:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return 0;
 88b:	31 c0                	xor    %eax,%eax
}
 88d:	c9                   	leave  
 88e:	c3                   	ret    
 88f:	90                   	nop

00000890 <malloc>:

void*
malloc(uint nbytes)
{
 890:	55                   	push   %ebp
  Header *p, *prevp;
  uint nunits;
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 891:	8b 0d 80 0e 00 00    	mov    0xe80,%ecx
{
 897:	89 e5                	mov    %esp,%ebp
 899:	56                   	push   %esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 89a:	8b 45 08             	mov    0x8(%ebp),%eax
{
 89d:	53                   	push   %ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 89e:	8d 58 07             	lea    0x7(%eax),%ebx
 8a1:	c1 eb 03             	shr    $0x3,%ebx
 8a4:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8a7:	85 c9                	test   %ecx,%ecx
 8a9:	74 65                	je     910 <malloc+0x80>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ab:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 8ad:	8b 50 04             	mov    0x4(%eax),%edx
 8b0:	39 d3                	cmp    %edx,%ebx
 8b2:	77 1d                	ja     8d1 <malloc+0x41>
 8b4:	eb 2e                	jmp    8e4 <malloc+0x54>
 8b6:	8d 76 00             	lea    0x0(%esi),%esi
 8b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c0:	8b 30                	mov    (%eax),%esi
    if(p->s.size >= nunits){
 8c2:	8b 56 04             	mov    0x4(%esi),%edx
 8c5:	39 da                	cmp    %ebx,%edx
 8c7:	73 27                	jae    8f0 <malloc+0x60>
 8c9:	8b 0d 80 0e 00 00    	mov    0xe80,%ecx
 8cf:	89 f0                	mov    %esi,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8d1:	39 c1                	cmp    %eax,%ecx
 8d3:	75 eb                	jne    8c0 <malloc+0x30>
      if((p = morecore(nunits)) == 0)
 8d5:	89 d8                	mov    %ebx,%eax
 8d7:	e8 64 ff ff ff       	call   840 <morecore>
 8dc:	85 c0                	test   %eax,%eax
 8de:	75 e0                	jne    8c0 <malloc+0x30>
        return 0;
  }
}
 8e0:	5b                   	pop    %ebx
 8e1:	5e                   	pop    %esi
 8e2:	5d                   	pop    %ebp
 8e3:	c3                   	ret    
    if(p->s.size >= nunits){
 8e4:	89 c6                	mov    %eax,%esi
 8e6:	89 c8                	mov    %ecx,%eax
 8e8:	90                   	nop
 8e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 8f0:	39 d3                	cmp    %edx,%ebx
 8f2:	74 4c                	je     940 <malloc+0xb0>
        p->s.size -= nunits;
 8f4:	29 da                	sub    %ebx,%edx
 8f6:	89 56 04             	mov    %edx,0x4(%esi)
        p += p->s.size;
 8f9:	8d 34 d6             	lea    (%esi,%edx,8),%esi
        p->s.size = nunits;
 8fc:	89 5e 04             	mov    %ebx,0x4(%esi)
}
 8ff:	5b                   	pop    %ebx
      freep = prevp;
 900:	a3 80 0e 00 00       	mov    %eax,0xe80
      return (void*)(p + 1);
 905:	8d 46 08             	lea    0x8(%esi),%eax
}
 908:	5e                   	pop    %esi
 909:	5d                   	pop    %ebp
 90a:	c3                   	ret    
 90b:	90                   	nop
 90c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 910:	c7 05 80 0e 00 00 84 	movl   $0xe84,0xe80
 917:	0e 00 00 
    base.s.size = 0;
 91a:	b9 84 0e 00 00       	mov    $0xe84,%ecx
    base.s.ptr = freep = prevp = &base;
 91f:	c7 05 84 0e 00 00 84 	movl   $0xe84,0xe84
 926:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 929:	89 c8                	mov    %ecx,%eax
    base.s.size = 0;
 92b:	c7 05 88 0e 00 00 00 	movl   $0x0,0xe88
 932:	00 00 00 
    if(p->s.size >= nunits){
 935:	eb 9a                	jmp    8d1 <malloc+0x41>
 937:	89 f6                	mov    %esi,%esi
 939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        prevp->s.ptr = p->s.ptr;
 940:	8b 16                	mov    (%esi),%edx
 942:	89 10                	mov    %edx,(%eax)
 944:	eb b9                	jmp    8ff <malloc+0x6f>
 946:	8d 76 00             	lea    0x0(%esi),%esi
 949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000950 <malloc_wf>:

// modify malloc to implement 'worst fit' strategy
void*
malloc_wf(uint nbytes)
{
 950:	55                   	push   %ebp
 951:	89 e5                	mov    %esp,%ebp
 953:	57                   	push   %edi
 954:	56                   	push   %esi
 955:	53                   	push   %ebx
 956:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp, *maxp, *maxprevp;
  uint nunits;
  uint max = 0;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 959:	8b 45 08             	mov    0x8(%ebp),%eax
 95c:	83 c0 07             	add    $0x7,%eax
 95f:	c1 e8 03             	shr    $0x3,%eax
 962:	83 c0 01             	add    $0x1,%eax
 965:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 968:	90                   	nop
 969:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  if((prevp = freep) == 0){
 970:	8b 1d 80 0e 00 00    	mov    0xe80,%ebx
 976:	85 db                	test   %ebx,%ebx
 978:	74 66                	je     9e0 <malloc_wf+0x90>
 97a:	8b 03                	mov    (%ebx),%eax
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }

  maxp = 0;
  maxprevp = 0;
 97c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  if((prevp = freep) == 0){
 983:	89 df                	mov    %ebx,%edi
  uint max = 0;
 985:	31 f6                	xor    %esi,%esi
  maxp = 0;
 987:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 98e:	8b 50 04             	mov    0x4(%eax),%edx
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 991:	eb 12                	jmp    9a5 <malloc_wf+0x55>
 993:	90                   	nop
 994:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->s.size >= nunits && p->s.size > max){
      max = p->s.size;
      maxp = p;
      maxprevp = prevp;
    }
    if(p == freep)
 998:	39 d8                	cmp    %ebx,%eax
 99a:	74 24                	je     9c0 <malloc_wf+0x70>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 99c:	8b 08                	mov    (%eax),%ecx
    if(p->s.size >= nunits && p->s.size > max){
 99e:	89 c7                	mov    %eax,%edi
 9a0:	8b 51 04             	mov    0x4(%ecx),%edx
 9a3:	89 c8                	mov    %ecx,%eax
 9a5:	39 d6                	cmp    %edx,%esi
 9a7:	73 ef                	jae    998 <malloc_wf+0x48>
 9a9:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
 9ac:	77 ea                	ja     998 <malloc_wf+0x48>
    if(p == freep)
 9ae:	39 d8                	cmp    %ebx,%eax
 9b0:	74 57                	je     a09 <malloc_wf+0xb9>
 9b2:	89 7d dc             	mov    %edi,-0x24(%ebp)
 9b5:	89 d6                	mov    %edx,%esi
 9b7:	89 45 e0             	mov    %eax,-0x20(%ebp)
 9ba:	eb e0                	jmp    99c <malloc_wf+0x4c>
 9bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      break;
  }

  if(maxp != 0){
 9c0:	8b 45 e0             	mov    -0x20(%ebp),%eax
 9c3:	85 c0                	test   %eax,%eax
 9c5:	75 39                	jne    a00 <malloc_wf+0xb0>
      p->s.size = nunits;
    }
    freep = prevp;
    return (void*)(p + 1);
  } else {
    if((p = morecore(nunits)) == 0)
 9c7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 9ca:	e8 71 fe ff ff       	call   840 <morecore>
 9cf:	85 c0                	test   %eax,%eax
 9d1:	75 9d                	jne    970 <malloc_wf+0x20>
      return 0;
    return malloc_wf(nbytes);
  }
 9d3:	83 c4 1c             	add    $0x1c,%esp
 9d6:	5b                   	pop    %ebx
 9d7:	5e                   	pop    %esi
 9d8:	5f                   	pop    %edi
 9d9:	5d                   	pop    %ebp
 9da:	c3                   	ret    
 9db:	90                   	nop
 9dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 9e0:	c7 05 80 0e 00 00 84 	movl   $0xe84,0xe80
 9e7:	0e 00 00 
 9ea:	c7 05 84 0e 00 00 84 	movl   $0xe84,0xe84
 9f1:	0e 00 00 
    base.s.size = 0;
 9f4:	c7 05 88 0e 00 00 00 	movl   $0x0,0xe88
 9fb:	00 00 00 
  if(maxp != 0){
 9fe:	eb c7                	jmp    9c7 <malloc_wf+0x77>
 a00:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 a03:	8b 7d dc             	mov    -0x24(%ebp),%edi
 a06:	8b 53 04             	mov    0x4(%ebx),%edx
    if(p->s.size == nunits){
 a09:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
 a0c:	74 1f                	je     a2d <malloc_wf+0xdd>
      p->s.size -= nunits;
 a0e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 a11:	29 c2                	sub    %eax,%edx
 a13:	89 53 04             	mov    %edx,0x4(%ebx)
      p = p + p->s.size;
 a16:	8d 1c d3             	lea    (%ebx,%edx,8),%ebx
      p->s.size = nunits;
 a19:	89 43 04             	mov    %eax,0x4(%ebx)
    freep = prevp;
 a1c:	89 3d 80 0e 00 00    	mov    %edi,0xe80
 a22:	83 c4 1c             	add    $0x1c,%esp
    return (void*)(p + 1);
 a25:	8d 43 08             	lea    0x8(%ebx),%eax
 a28:	5b                   	pop    %ebx
 a29:	5e                   	pop    %esi
 a2a:	5f                   	pop    %edi
 a2b:	5d                   	pop    %ebp
 a2c:	c3                   	ret    
      prevp->s.ptr = p->s.ptr;
 a2d:	8b 03                	mov    (%ebx),%eax
 a2f:	89 07                	mov    %eax,(%edi)
 a31:	eb e9                	jmp    a1c <malloc_wf+0xcc>
