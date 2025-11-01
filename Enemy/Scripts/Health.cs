using Godot;
using System;
using System.ComponentModel.DataAnnotations;

public partial class Health : Node
{
	[ExportGroup("生命值")]
	/// <summary>
	/// 最大的生命值	
	/// </summary>
	[Export] private float maxHealth = 100;
	/// <summary>
	/// 最大的生命值
	/// </summary>
	/// <remarks>
	/// 在这里set maxHealth很不安全<para/>
	/// 你可以通过<see cref="SetMaxHealth(float, bool)"/>方法来修改maxHealth,
	/// 并选择是否要按照比例来修改currentHealth
	/// </remarks>
	/// <value><see cref="maxHealth"/></value>
	public float MaxHealth { get { return maxHealth; } set { maxHealth = value; } }
	public void SetMaxHealth(float value, AllEnum.SetMaxHealthMode mode = AllEnum.SetMaxHealthMode.Set,AllEnum.SetCurrentHealthMode currentHealthMode = AllEnum.SetCurrentHealthMode.Proportion)	
	{
		
	}
	[Export] private float currentHealth;
	/// <summary>
	/// 当前的生命值
	/// </summary>
	/// <value><see cref="currentHealth"/></value>
	public float CurrentHealth { get { return currentHealth; } set { currentHealth = value; } }

	public string Test(float value, AllEnum.SetCurrentHealthMode mode = AllEnum.SetCurrentHealthMode.Proportion)
	{
		return value.ToString() + mode.ToString();
	}
}
