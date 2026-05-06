import subprocess
import json

def get_mako_status():
    try:
        # Get list of active notifications
        output = subprocess.check_output(["makoctl", "list"]).decode("utf-8")
        data = json.loads(output)
        count = len(data.get("data", [[]])[0])
        
        # Check if DND is on
        mode = subprocess.check_output(["makoctl", "mode"]).decode("utf-8").strip()
        
        icon = "none"
        if "do-not-disturb" in mode:
            icon = "dnd"
        elif count > 0:
            icon = "notification"
            
        return {"text": str(count) if count > 0 else "", "alt": icon, "class": icon}
    except:
        return {"text": "!", "alt": "none"}

print(json.dumps(get_mako_status()))
