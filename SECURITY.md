# Security Policy

## 🔒 Supported Versions

We release security updates for the following versions:

| Version | Supported          |
| ------- | ------------------ |
| 1.0.x   | :white_check_mark: |
| < 1.0   | :x:                |

## 🚨 Reporting a Vulnerability

We take security seriously. If you discover a security vulnerability in Truth Lens, please follow responsible disclosure:

### ⚠️ DO NOT

- ❌ Open a public GitHub issue
- ❌ Discuss the vulnerability publicly
- ❌ Share exploit code publicly

### ✅ DO

1. **Email us privately**: security@truth-lens.ai
2. **Include detailed information**:
   - Type of vulnerability
   - Steps to reproduce
   - Potential impact
   - Affected versions
   - Suggested fix (if any)
3. **Allow time for response**: We aim to respond within 48 hours

### 📧 Report Template

```
Subject: [SECURITY] Brief description

Vulnerability Type: [e.g., Input validation, Authentication bypass]
Severity: [Critical/High/Medium/Low]

Description:
[Clear description of the vulnerability]

Steps to Reproduce:
1. [Step 1]
2. [Step 2]
3. [Step 3]

Impact:
[Potential consequences if exploited]

Proof of Concept:
[Code snippet or screenshot if applicable]

Suggested Fix:
[If you have ideas for remediation]

Disclosure Timeline Preference:
[Your preferred disclosure timeline]
```

## ⏱️ Response Timeline

- **Initial acknowledgment**: Within 48 hours
- **Status update**: Within 7 days
- **Resolution timeline**:
  - **Critical**: 1-2 days
  - **High**: 3-7 days
  - **Medium**: 7-14 days
  - **Low**: 14-30 days

## 🛡️ Security Best Practices

### For Deployment

When deploying Truth Lens in production:

#### Network Security
- ✅ Use HTTPS (TLS 1.2+) for all connections
- ✅ Implement firewall rules
- ✅ Restrict port access (only 8501 or custom port)
- ✅ Use reverse proxy (nginx/Apache) with rate limiting

#### Input Validation
- ✅ Validate file types (WAV, MP3 only)
- ✅ Enforce file size limits (10MB default)
- ✅ Scan uploaded files for malware (ClamAV recommended)
- ✅ Sanitize file names and metadata

#### Authentication & Authorization
- ✅ Implement authentication for production APIs
- ✅ Use API keys with rate limiting
- ✅ Enable CORS restrictions
- ✅ Log all access attempts

#### Data Protection
- ✅ No audio persistence (process in-memory only)
- ✅ Clear temporary files after processing
- ✅ Encrypt data in transit (HTTPS)
- ✅ Use environment variables for secrets

#### Dependencies
- ✅ Keep all dependencies updated
- ✅ Run `pip-audit` or `safety` regularly
- ✅ Monitor security advisories
- ✅ Use `requirements-lock.txt` for reproducibility

### For Developers

#### Secure Coding
```python
# Good: Validate input
def process_audio(file):
    if file.size > 10 * 1024 * 1024:  # 10MB
        raise ValueError("File too large")
    if not file.name.endswith(('.wav', '.mp3')):
        raise ValueError("Invalid format")
    # Process...

# Bad: No validation
def process_audio(file):
    # Process any file...
```

#### Avoid Hardcoding Secrets
```python
# Good: Environment variables
API_KEY = os.getenv('API_KEY')

# Bad: Hardcoded
API_KEY = "sk-1234567890abcdef"
```

## 🔍 Known Security Considerations

### Current Limitations

1. **Model Security**
   - Model files (.pkl) should not be exposed via web server
   - Models are not encrypted (consider encryption for sensitive deployments)
   - No model watermarking (planned for v2.0)

2. **File Upload**
   - 10MB size limit enforced by default
   - No virus scanning (implement ClamAV in production)
   - Accepted formats: WAV, MP3, FLAC

3. **Data Privacy**
   - Uploaded audio processed in-memory only
   - No server-side storage of audio files
   - Reports downloaded to user device (not stored)
   - GDPR compliant by design

4. **Rate Limiting**
   - Not enforced by default (implement in production)
   - Recommended: 1 upload per 5 seconds per IP
   - Use nginx or API gateway for rate limiting

### Mitigations in Place

✅ **No External API Calls** - All inference is local  
✅ **Deterministic Output** - No randomness in predictions  
✅ **Integrity Hashing** - SHA-256 for report verification  
✅ **Input Validation** - File type and size checks  
✅ **Error Handling** - Graceful failures without exposing internals  

## 📢 Security Updates

Security updates are published via:

1. **GitHub Security Advisories** - https://github.com/yourusername/truth-lens/security/advisories
2. **CHANGELOG.md** - Tagged with `[SECURITY]`
3. **Release Notes** - Each version release
4. **Email** - To registered users (for critical issues)

Subscribe to releases to receive notifications:
```
Watch → Custom → Releases
```

## 🏆 Acknowledgments

We appreciate security researchers who responsibly disclose vulnerabilities:

- Acknowledged researchers will be credited in security advisories
- Recognition in SECURITY.md (with permission)
- Swag and bounties for critical findings (coming soon)

### Hall of Fame

*No vulnerabilities reported yet. Be the first!*

## 📞 Contact

- **Security issues**: security@truth-lens.ai
- **General questions**: team@truth-lens.ai
- **PGP Key**: [Coming soon]

---

**Thank you for helping keep Truth Lens secure!** 🔒
